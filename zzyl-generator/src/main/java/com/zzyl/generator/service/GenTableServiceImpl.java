package com.zzyl.generator.service;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.zzyl.common.constant.Constants;
import com.zzyl.common.constant.GenConstants;
import com.zzyl.common.core.text.CharsetKit;
import com.zzyl.common.exception.ServiceException;
import com.zzyl.common.utils.StringUtils;
import com.zzyl.generator.domain.GenTable;
import com.zzyl.generator.domain.GenTableColumn;
import com.zzyl.generator.mapper.GenTableColumnMapper;
import com.zzyl.generator.mapper.GenTableMapper;
import com.zzyl.generator.util.GenUtils;
import com.zzyl.generator.util.VelocityInitializer;
import com.zzyl.generator.util.VelocityUtils;

/**
 * 代码生成业务服务层实现类
 * 负责处理数据库表结构解析、代码生成配置、代码渲染等核心逻辑
 *
 * @author ruoyi
 */
@Service
public class GenTableServiceImpl implements IGenTableService {
    // 日志记录器，用于输出程序运行日志
    private static final Logger log = LoggerFactory.getLogger(GenTableServiceImpl.class);

    // 注入表结构Mapper，用于数据库表结构相关的CRUD操作
    @Autowired
    private GenTableMapper genTableMapper;

    // 注入表字段Mapper，用于数据库表字段相关的CRUD操作
    @Autowired
    private GenTableColumnMapper genTableColumnMapper;

    /**
     * 根据ID查询代码生成表信息
     *
     * @param id 业务ID（代码生成配置表的主键）
     * @return 包含详细配置的GenTable对象
     */
    @Override
    public GenTable selectGenTableById(Long id) {
        // 从数据库查询表信息
        GenTable genTable = genTableMapper.selectGenTableById(id);
        // 设置表的额外配置信息（从JSON选项中解析）
        setTableFromOptions(genTable);
        return genTable;
    }

    /**
     * 分页查询代码生成表配置列表
     *
     * @param genTable 包含查询条件的GenTable对象
     * @return 符合条件的表配置集合
     */
    @Override
    public List<GenTable> selectGenTableList(GenTable genTable) {
        return genTableMapper.selectGenTableList(genTable);
    }

    /**
     * 查询数据库中可生成代码的表列表（未配置过代码生成的表）
     *
     * @param genTable 包含查询条件的GenTable对象
     * @return 数据库表集合
     */
    @Override
    public List<GenTable> selectDbTableList(GenTable genTable) {
        return genTableMapper.selectDbTableList(genTable);
    }

    /**
     * 根据表名数组查询数据库表信息
     *
     * @param tableNames 表名称数组
     * @return 数据库表信息集合
     */
    @Override
    public List<GenTable> selectDbTableListByNames(String[] tableNames) {
        return genTableMapper.selectDbTableListByNames(tableNames);
    }

    /**
     * 查询所有已配置的代码生成表信息
     *
     * @return 所有表配置集合
     */
    @Override
    public List<GenTable> selectGenTableAll() {
        return genTableMapper.selectGenTableAll();
    }

    /**
     * 修改代码生成表配置
     * 包含表信息和字段信息的更新，使用事务保证数据一致性
     *
     * @param genTable 包含更新信息的GenTable对象
     */
    @Override
    @Transactional
    public void updateGenTable(GenTable genTable) {
        // 将表的额外参数（Map类型）转换为JSON字符串存储
        String options = JSON.toJSONString(genTable.getParams());
        genTable.setOptions(options);
        // 更新表信息
        int row = genTableMapper.updateGenTable(genTable);
        if (row > 0) {
            // 循环更新表字段信息
            for (GenTableColumn genTableColumn : genTable.getColumns()) {
                genTableColumnMapper.updateGenTableColumn(genTableColumn);
            }
        }
    }

    /**
     * 批量删除代码生成表配置
     * 同时删除关联的字段配置，使用事务保证数据一致性
     *
     * @param tableIds 需要删除的表ID数组
     */
    @Override
    @Transactional
    public void deleteGenTableByIds(Long[] tableIds) {
        // 删除表配置
        genTableMapper.deleteGenTableByIds(tableIds);
        // 删除关联的字段配置
        genTableColumnMapper.deleteGenTableColumnByIds(tableIds);
    }

    /**
     * 执行SQL创建表（从生成的代码反向创建数据库表）
     *
     * @param sql 创建表的SQL语句
     * @return 创建成功返回true，否则返回false
     */
    @Override
    public boolean createTable(String sql) {
        // 执行SQL，返回影响行数（创建表成功通常返回0或1，不同数据库驱动可能有差异）
        return genTableMapper.createTable(sql) == 0;
    }

    /**
     * 导入数据库表结构并初始化代码生成配置
     *
     * @param tableList 待导入的表信息列表
     * @param operName  操作人名称
     */
    @Override
    @Transactional
    public void importGenTable(List<GenTable> tableList, String operName) {
        try {
            for (GenTable table : tableList) {
                String tableName = table.getTableName();
                // 初始化表的基本配置（如类名、包名等）
                GenUtils.initTable(table, operName);
                // 插入表配置
                int row = genTableMapper.insertGenTable(table);
                if (row > 0) {
                    // 查询该表的所有字段信息
                    List<GenTableColumn> genTableColumns = genTableColumnMapper.selectDbTableColumnsByName(tableName);
                    // 初始化字段配置并保存
                    for (GenTableColumn column : genTableColumns) {
                        GenUtils.initColumnField(column, table);
                        genTableColumnMapper.insertGenTableColumn(column);
                    }
                }
            }
        } catch (Exception e) {
            throw new ServiceException("导入失败：" + e.getMessage());
        }
    }

    /**
     * 预览生成的代码
     *
     * @param tableId 表ID
     * @return 键为模板路径，值为渲染后的代码内容的Map
     */
    @Override
    public Map<String, String> previewCode(Long tableId) {
        // 用于存储预览的代码，LinkedHashMap保证顺序与模板列表一致
        Map<String, String> dataMap = new LinkedHashMap<>();
        // 查询表信息
        GenTable table = genTableMapper.selectGenTableById(tableId);
        // 设置主子表信息（如果有子表）
        setSubTable(table);
        // 设置主键列信息
        setPkColumn(table);
        // 初始化Velocity模板引擎
        VelocityInitializer.initVelocity();

        // 准备Velocity上下文（包含生成代码所需的所有变量）
        VelocityContext context = VelocityUtils.prepareContext(table);

        // 获取该表对应的模板列表（根据表类型选择不同的模板）
        List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory(), table.getTplWebType());
        for (String template : templates) {
            // 渲染模板：将上下文数据填充到模板中
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, Constants.UTF8);
            tpl.merge(context, sw);
            // 将渲染后的代码放入Map
            dataMap.put(template, sw.toString());
        }
        return dataMap;
    }

    /**
     * 生成代码并打包为ZIP文件（下载方式）
     *
     * @param tableName 表名称
     * @return 包含所有生成文件的ZIP字节数组
     */
    @Override
    public byte[] downloadCode(String tableName) {
        // 字节数组输出流，用于存储ZIP文件内容
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        // ZIP输出流，用于创建ZIP文件
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        // 生成代码并写入ZIP流
        generatorCode(tableName, zip);
        // 关闭ZIP流（不关闭可能导致文件损坏）
        IOUtils.closeQuietly(zip);
        // 返回ZIP字节数组
        return outputStream.toByteArray();
    }

    /**
     * 生成代码到指定路径（自定义路径方式）
     *
     * @param tableName 表名称
     */
    @Override
    public void generatorCode(String tableName) {
        // 查询表信息
        GenTable table = genTableMapper.selectGenTableByName(tableName);
        // 设置主子表信息
        setSubTable(table);
        // 设置主键列信息
        setPkColumn(table);

        // 初始化Velocity模板引擎
        VelocityInitializer.initVelocity();

        // 准备上下文数据
        VelocityContext context = VelocityUtils.prepareContext(table);

        // 获取模板列表
        List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory(), table.getTplWebType());
        for (String template : templates) {
            // 过滤不需要生成到文件的模板（如SQL模板可能仅用于预览）
            if (!StringUtils.containsAny(template, "sql.vm", "api.js.vm", "index.vue.vm", "index-tree.vue.vm")) {
                // 渲染模板
                StringWriter sw = new StringWriter();
                Template tpl = Velocity.getTemplate(template, Constants.UTF8);
                tpl.merge(context, sw);
                try {
                    // 获取生成文件的路径
                    String path = getGenPath(table, template);
                    // 将渲染后的内容写入文件
                    FileUtils.writeStringToFile(new File(path), sw.toString(), CharsetKit.UTF_8);
                } catch (IOException e) {
                    throw new ServiceException("渲染模板失败，表名：" + table.getTableName());
                }
            }
        }
    }

    /**
     * 同步数据库表结构到代码生成配置
     * 当数据库表结构发生变化时，更新对应的代码生成配置
     *
     * @param tableName 表名称
     */
    @Override
    @Transactional
    public void synchDb(String tableName) {
        // 查询当前表配置
        GenTable table = genTableMapper.selectGenTableByName(tableName);
        // 获取当前配置的字段列表
        List<GenTableColumn> tableColumns = table.getColumns();
        // 将字段列表转换为Map，便于根据字段名查询
        Map<String, GenTableColumn> tableColumnMap = tableColumns.stream()
                .collect(Collectors.toMap(GenTableColumn::getColumnName, Function.identity()));

        // 查询数据库中最新的字段信息
        List<GenTableColumn> dbTableColumns = genTableColumnMapper.selectDbTableColumnsByName(tableName);
        if (StringUtils.isEmpty(dbTableColumns)) {
            throw new ServiceException("同步数据失败，原表结构不存在");
        }
        // 提取数据库字段名列表，用于判断哪些字段被删除
        List<String> dbTableColumnNames = dbTableColumns.stream()
                .map(GenTableColumn::getColumnName)
                .collect(Collectors.toList());

        // 处理每个数据库字段
        dbTableColumns.forEach(column -> {
            // 初始化字段配置
            GenUtils.initColumnField(column, table);
            if (tableColumnMap.containsKey(column.getColumnName())) {
                // 字段已存在，更新配置（保留部分用户自定义配置）
                GenTableColumn prevColumn = tableColumnMap.get(column.getColumnName());
                column.setColumnId(prevColumn.getColumnId());
                if (column.isList()) {
                    // 如果是列表展示字段，保留原有的查询方式和字典类型
                    column.setDictType(prevColumn.getDictType());
                    column.setQueryType(prevColumn.getQueryType());
                }
                if (StringUtils.isNotEmpty(prevColumn.getIsRequired()) && !column.isPk()
                        && (column.isInsert() || column.isEdit())
                        && ((column.isUsableColumn()) || (!column.isSuperColumn()))) {
                    // 保留必填项和显示类型配置
                    column.setIsRequired(prevColumn.getIsRequired());
                    column.setHtmlType(prevColumn.getHtmlType());
                }
                // 更新字段配置
                genTableColumnMapper.updateGenTableColumn(column);
            } else {
                // 字段不存在，新增配置
                genTableColumnMapper.insertGenTableColumn(column);
            }
        });

        // 删除数据库中已不存在的字段配置
        List<GenTableColumn> delColumns = tableColumns.stream()
                .filter(column -> !dbTableColumnNames.contains(column.getColumnName()))
                .collect(Collectors.toList());
        if (StringUtils.isNotEmpty(delColumns)) {
            genTableColumnMapper.deleteGenTableColumns(delColumns);
        }
    }

    /**
     * 批量生成多个表的代码并打包为ZIP（下载方式）
     *
     * @param tableNames 表名称数组
     * @return 包含所有生成文件的ZIP字节数组
     */
    @Override
    public byte[] downloadCode(String[] tableNames) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        for (String tableName : tableNames) {
            generatorCode(tableName, zip);
        }
        IOUtils.closeQuietly(zip);
        return outputStream.toByteArray();
    }

    /**
     * 生成单个表的代码并写入ZIP流
     *
     * @param tableName 表名称
     * @param zip       ZIP输出流
     */
    private void generatorCode(String tableName, ZipOutputStream zip) {
        // 查询表信息
        GenTable table = genTableMapper.selectGenTableByName(tableName);
        // 设置主子表和主键信息
        setSubTable(table);
        setPkColumn(table);

        // 初始化Velocity
        VelocityInitializer.initVelocity();
        // 准备上下文
        VelocityContext context = VelocityUtils.prepareContext(table);

        // 获取模板列表
        List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory(), table.getTplWebType());
        for (String template : templates) {
            // 渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, Constants.UTF8);
            tpl.merge(context, sw);
            try {
                // 添加ZIP条目（文件路径）
                zip.putNextEntry(new ZipEntry(VelocityUtils.getFileName(template, table)));
                // 写入文件内容
                IOUtils.write(sw.toString(), zip, Constants.UTF8);
                // 关闭字符串写入流
                IOUtils.closeQuietly(sw);
                // 刷新并关闭当前ZIP条目
                zip.flush();
                zip.closeEntry();
            } catch (IOException e) {
                log.error("渲染模板失败，表名：" + table.getTableName(), e);
            }
        }
    }

    /**
     * 验证表配置是否符合生成要求（主要针对树形表和主子表）
     *
     * @param genTable 表配置信息
     */
    @Override
    public void validateEdit(GenTable genTable) {
        // 树形表模板校验
        if (GenConstants.TPL_TREE.equals(genTable.getTplCategory())) {
            String options = JSON.toJSONString(genTable.getParams());
            JSONObject paramsObj = JSON.parseObject(options);
            if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_CODE))) {
                throw new ServiceException("树编码字段不能为空");
            } else if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_PARENT_CODE))) {
                throw new ServiceException("树父编码字段不能为空");
            } else if (StringUtils.isEmpty(paramsObj.getString(GenConstants.TREE_NAME))) {
                throw new ServiceException("树名称字段不能为空");
            }
        }
        // 主子表模板校验
        else if (GenConstants.TPL_SUB.equals(genTable.getTplCategory())) {
            if (StringUtils.isEmpty(genTable.getSubTableName())) {
                throw new ServiceException("关联子表的表名不能为空");
            } else if (StringUtils.isEmpty(genTable.getSubTableFkName())) {
                throw new ServiceException("子表关联的外键名不能为空");
            }
        }
    }

    /**
     * 设置表的主键列信息
     *
     * @param table 表信息
     */
    public void setPkColumn(GenTable table) {
        for (GenTableColumn column : table.getColumns()) {
            if (column.isPk()) {
                table.setPkColumn(column);
                break;
            }
        }
        // 如果没有明确的主键，默认第一个字段为主键
        if (StringUtils.isNull(table.getPkColumn())) {
            table.setPkColumn(table.getColumns().get(0));
        }
        // 处理子表的主键
        if (GenConstants.TPL_SUB.equals(table.getTplCategory())) {
            for (GenTableColumn column : table.getSubTable().getColumns()) {
                if (column.isPk()) {
                    table.getSubTable().setPkColumn(column);
                    break;
                }
            }
            if (StringUtils.isNull(table.getSubTable().getPkColumn())) {
                table.getSubTable().setPkColumn(table.getSubTable().getColumns().get(0));
            }
        }
    }

    /**
     * 设置主子表信息（如果当前表是主表，关联子表信息）
     *
     * @param table 主表信息
     */
    public void setSubTable(GenTable table) {
        String subTableName = table.getSubTableName();
        if (StringUtils.isNotEmpty(subTableName)) {
            // 查询子表信息并设置到主表中
            table.setSubTable(genTableMapper.selectGenTableByName(subTableName));
        }
    }

    /**
     * 从JSON选项中解析表的额外配置信息（如树形表配置、父菜单信息等）
     *
     * @param genTable 表信息
     */
    public void setTableFromOptions(GenTable genTable) {
        JSONObject paramsObj = JSON.parseObject(genTable.getOptions());
        if (StringUtils.isNotNull(paramsObj)) {
            // 树形表相关配置
            String treeCode = paramsObj.getString(GenConstants.TREE_CODE);
            String treeParentCode = paramsObj.getString(GenConstants.TREE_PARENT_CODE);
            String treeName = paramsObj.getString(GenConstants.TREE_NAME);
            // 菜单相关配置
            Long parentMenuId = paramsObj.getLongValue(GenConstants.PARENT_MENU_ID);
            String parentMenuName = paramsObj.getString(GenConstants.PARENT_MENU_NAME);

            // 设置到表信息中
            genTable.setTreeCode(treeCode);
            genTable.setTreeParentCode(treeParentCode);
            genTable.setTreeName(treeName);
            genTable.setParentMenuId(parentMenuId);
            genTable.setParentMenuName(parentMenuName);
        }
    }

    /**
     * 计算代码生成的目标文件路径
     *
     * @param table    表信息
     * @param template 模板路径
     * @return 生成文件的完整路径
     */
    public static String getGenPath(GenTable table, String template) {
        String genPath = table.getGenPath();
        if (StringUtils.equals(genPath, "/")) {
            // 如果生成路径为根目录，默认生成到项目的src目录下
            return System.getProperty("user.dir") + File.separator + "src" + File.separator
                    + VelocityUtils.getFileName(template, table);
        }
        // 否则使用自定义的生成路径
        return genPath + File.separator + VelocityUtils.getFileName(template, table);
    }
}