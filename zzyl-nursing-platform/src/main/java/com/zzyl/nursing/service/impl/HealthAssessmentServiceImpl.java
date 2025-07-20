package com.zzyl.nursing.service.impl;

import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zzyl.common.ai.AIModelInvoker;
import com.zzyl.common.exception.base.BaseException;
import com.zzyl.common.utils.IDCardUtils;
import com.zzyl.common.utils.StringUtils;
import com.zzyl.nursing.domain.HealthAssessment;
import com.zzyl.nursing.domain.dto.HealthAssessmentDTO;
import com.zzyl.nursing.mapper.HealthAssessmentMapper;
import com.zzyl.nursing.service.IHealthAssessmentService;
import com.zzyl.nursing.domain.vo.HealthReportVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 健康评估Service业务层处理
 * 该类实现了健康评估相关的业务逻辑处理
 *
 * @author ruoyi
 * @date 2024-10-10
 */
@Service
public class HealthAssessmentServiceImpl extends ServiceImpl<HealthAssessmentMapper, HealthAssessment> implements IHealthAssessmentService {
    // 自动注入健康评估的Mapper接口，用于数据库交互
    @Autowired
    private HealthAssessmentMapper healthAssessmentMapper;

    // 自动注入AI模型调用器，用于调用AI模型进行分析
    @Autowired
    private AIModelInvoker aIModelInvoker;

    // 自动注入Redis模板，用于操作Redis缓存
    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 查询健康评估
     * 根据主键ID查询健康评估记录
     *
     * @param id 健康评估主键
     * @return 健康评估实体对象
     */
    @Override
    public HealthAssessment selectHealthAssessmentById(Long id) {
        // 调用MyBatis-Plus提供的getById方法，根据ID查询记录
        return getById(id);
    }

    /**
     * 查询健康评估列表
     * 根据条件查询健康评估记录列表
     *
     * @param healthAssessment 健康评估实体对象（作为查询条件）
     * @return 健康评估实体对象列表
     */
    @Override
    public List<HealthAssessment> selectHealthAssessmentList(HealthAssessment healthAssessment) {
        // 调用Mapper的自定义方法，根据条件查询列表
        return healthAssessmentMapper.selectHealthAssessmentList(healthAssessment);
    }

    /**
     * 修改健康评估
     * 更新健康评估记录
     *
     * @param healthAssessment 健康评估实体对象（包含更新信息）
     * @return 结果（1表示成功，0表示失败）
     */
    @Override
    public int updateHealthAssessment(HealthAssessment healthAssessment) {
        // 调用MyBatis-Plus的updateById方法更新记录，返回布尔值，转换为1或0
        return updateById(healthAssessment) ? 1 : 0;
    }

    /**
     * 批量删除健康评估
     * 根据主键数组批量删除健康评估记录
     *
     * @param ids 需要删除的健康评估主键数组
     * @return 结果（1表示成功，0表示失败）
     */
    @Override
    public int deleteHealthAssessmentByIds(Long[] ids) {
        // 调用MyBatis-Plus的removeByIds方法批量删除，返回布尔值，转换为1或0
        return removeByIds(Arrays.asList(ids)) ? 1 : 0;
    }

    /**
     * 删除健康评估信息
     * 根据主键ID删除健康评估记录
     *
     * @param id 健康评估主键
     * @return 结果（1表示成功，0表示失败）
     */
    @Override
    public int deleteHealthAssessmentById(Long id) {
        // 调用MyBatis-Plus的removeById方法删除记录，返回布尔值，转换为1或0
        return removeById(id) ? 1 : 0;
    }

    /**
     * 新增健康评估
     * 接收前端传递的健康评估数据，调用AI分析后保存到数据库
     *
     * @param dto 健康评估DTO（前端传递的参数对象）
     * @return 新增记录的主键ID
     */
    @Override
    public Long insertHealthAssessment(HealthAssessmentDTO dto) {
        // 1.组装AI模型的提示词（Prompt）
        String prompt = getPrompt(dto);

        // 2.调用千帆大模型分析数据，返回JSON类型的结果
        String result = aIModelInvoker.qianfanInvoker(prompt);

        // 如果AI返回结果为空，抛出异常
        if (StringUtils.isEmpty(result)) {
            throw new BaseException("AI分析失败");
        }

        // 3.解析AI返回的JSON数据为HealthReportVO对象
        HealthReportVO healthReportVO = null;
        try {
            // 创建Jackson的ObjectMapper实例，用于JSON转换
            ObjectMapper objectMapper = new ObjectMapper();
            // 配置忽略JSON中未知的属性，避免转换失败
            objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

            // 解析外层JSON为Map对象
            Map<?, ?> outerMap = objectMapper.readValue(result, Map.class);

            // 获取choices列表中的第一个元素（AI返回结果的主体内容）
            List<Map<?, ?>> choices = (List<Map<?, ?>>) outerMap.get("choices");
            if (choices != null && !choices.isEmpty()) {
                Map<?, ?> firstChoice = choices.get(0);

                // 获取message对象（包含具体的分析内容）
                Map<?, ?> message = (Map<?, ?>) firstChoice.get("message");

                // 获取content字段（分析内容的文本）
                String content = (String) message.get("content");

                // 移除Markdown代码块标记（```json和```），清理文本
                content = content.replace("```json", "").replace("```", "").trim();
                // 使用Hutool的JSONUtil将清理后的JSON文本转换为HealthReportVO对象
                healthReportVO = JSONUtil.toBean(content, HealthReportVO.class);
            }
        } catch (IOException e) {
            // 打印异常堆栈信息
            e.printStackTrace();
        }

        // 4.保存数据（AI解析的数据和前端传递的数据）
        Long id = insertHealthReport(healthReportVO, dto);

        // 5.返回新增数据的主键ID
        return id;
    }

    /**
     * 抽取的辅助方法：保存健康评估数据到数据库
     *
     * @param healthReportVO AI解析后的健康报告数据
     * @param dto            前端传递的健康评估参数
     * @return 新增记录的主键ID
     */
    private Long insertHealthReport(HealthReportVO healthReportVO, HealthAssessmentDTO dto) {
        // 1.创建健康评估实体对象
        HealthAssessment healthAssessment = new HealthAssessment();
        // 2.封装数据（从DTO和AI解析结果中提取字段赋值）
        healthAssessment.setElderName(dto.getElderName());  // 老人姓名
        healthAssessment.setIdCard(dto.getIdCard());        // 身份证号
        // 从身份证号中解析生日、年龄、性别
        healthAssessment.setBirthDate(IDCardUtils.getBirthDateByIdCard(dto.getIdCard()));
        healthAssessment.setAge(IDCardUtils.getAgeByIdCard(dto.getIdCard()));
        healthAssessment.setGender(IDCardUtils.getGenderFromIdCard(dto.getIdCard()));

        // 健康评分、危险等级、是否建议入住（从AI结果中提取）
        double healthScore = healthReportVO.getHealthAssessment().getHealthIndex();
        healthAssessment.setHealthScore(String.valueOf(healthScore));  // 健康评分转换为字符串存储
        healthAssessment.setRiskLevel(healthReportVO.getHealthAssessment().getRiskLevel());  // 危险等级
        // 健康评分>=60分建议入住（0表示建议，1表示不建议）
        healthAssessment.setSuggestionForAdmission(healthScore >= 60 ? 0 : 1);

        // 推荐护理等级、入住状态、总检日期、体检机构、体检报告URL、评估时间等字段赋值
        healthAssessment.setNursingLevelName(getNursingLevelName(healthScore));  // 推荐护理等级
        healthAssessment.setAdmissionStatus(1);  // 入住状态（1表示未入住，具体含义需看业务定义）
        healthAssessment.setTotalCheckDate(healthReportVO.getTotalCheckDate());  // 总检日期
        healthAssessment.setPhysicalExamInstitution(dto.getPhysicalExamInstitution());  // 体检机构
        healthAssessment.setPhysicalReportUrl(dto.getPhysicalReportUrl());  // 体检报告URL
        healthAssessment.setAssessmentTime(LocalDateTime.now());  // 评估时间（当前时间）
        healthAssessment.setReportSummary(healthReportVO.getSummarize());  // 报告总结
        // 将对象转换为JSON字符串存储（疾病风险、异常分析、系统分值）
        healthAssessment.setDiseaseRisk(JSONUtil.toJsonStr(healthReportVO.getRiskDistribution()));
        healthAssessment.setAbnormalAnalysis(JSONUtil.toJsonStr(healthReportVO.getAbnormalData()));
        healthAssessment.setSystemScore(JSONUtil.toJsonStr(healthReportVO.getSystemScore()));

        // 保存实体对象到数据库，MyBatis-Plus的save方法会自动生成主键并赋值
        save(healthAssessment);
        // 返回新增记录的主键ID
        return healthAssessment.getId();
    }

    /**
     * 抽取的辅助方法：根据健康评分获取推荐的护理等级名称
     *
     * @param healthScore 健康评分（0-100分）
     * @return 护理等级名称
     */
    private String getNursingLevelName(double healthScore) {
        // 如果健康评分不在0-100范围内，抛出异常
        if (healthScore < 0 || healthScore > 100) {
            throw new BaseException("健康评分不在0-100之间");
        }
        // 根据健康评分区间返回对应的护理等级
        if (healthScore >= 90) {
            return "三级护理";
        } else if (healthScore >= 80) {
            return "二级护理";
        } else if (healthScore >= 70) {
            return "一级护理";
        } else if (healthScore >= 60) {
            return "特级护理";
        }
        // 60分以下不建议入住
        return "不建议入住";
    }

    /**
     * 组装AI模型的提示词（Prompt）
     *
     * @param dto 健康评估DTO（包含前端传递的参数）
     * @return 组装好的提示词字符串
     */
    private String getPrompt(HealthAssessmentDTO dto) {
        // 1.从Redis中获取体检报告内容（键为"healthReport"，字段为身份证号）
        String content = (String) redisTemplate.opsForHash().get("healthReport", dto.getIdCard());
        // 如果Redis中没有对应的体检内容，抛出异常
        if (StringUtils.isEmpty(content)) {
            throw new BaseException("文件提取内容失败，请重新上传提交报告");
        }
        // 2.删除Redis中存储的该体检报告内容（避免重复使用）
        redisTemplate.opsForHash().delete("healthReport", dto.getIdCard());
        // 3.组装提示词（包含分析要求和格式要求）
        String prompt = "请以一个专业医生的视角来分析这份体检报告，报告中包含了一些异常数据，我需要您对这些数据进行解读，并给出相应的健康建议。\n" +
                "体检内容如下：\n" +
                content +
                "\n" +
                "\n" +
                "要求：\n" +
                "1. 提取体检报告中的“总检日期”；\n" +
                "2. 通过临床医学、疾病风险评估模型和数据智能分析，给该用户的风险等级和健康指数给出结果。风险等级分为：健康、提示、风险、危险、严重危险。健康指数范围为0至100分；\n" +
                "3. 根据用户身体各项指标数据，详细说明该用户各项风险等级的占比是多少，最多保留两位小数。结论格式：该用户健康占比20.00%，提示占比20.00%，风险占比20%，危险占比20%，严重危险占比20%；\n" +
                "4. 对于体检报告中的异常数据，请列出（异常数据的结论、体检项目名称、检查结果、参考值、单位、异常解读、建议）这8字段。解读异常数据，解决这些数据可能代表的健康问题或风险。分析可能的原因，包括但不限于生活习惯、饮食习惯、遗传因素等。基于这些异常数据和可能的原因，请给出具体的健康建议，包括饮食调整、运动建议、生活方式改变以及是否需要进一步检查或治疗等。\n" +
                "结论格式：异常数据的结论：肥胖，体检项目名称：体重指数BMI，检查结果：29.2，参考值>24，单位：-。异常解读：体重超标包括超重与肥胖。体重指数（BMI）=体重（kg）/身⾼（m）的平⽅，BMI≥24为超重，BMI≥28为肥胖；男性腰围≥90cm和⼥性腰围≥85cm为腹型肥胖。体重超标是⼀种由多因素（如遗传、进⻝油脂较多、运动少、疾病等）引起的慢性代谢性疾病，尤其是肥胖，已经被世界卫⽣组织列为导致疾病负担的⼗⼤危险因素之⼀。AI建议：采取综合措施预防和控制体重，积极改变⽣活⽅式，宜低脂、低糖、⾼纤维素膳⻝，多⻝果蔬及菌藻类⻝物，增加有氧运动。若有相关疾病（如⾎脂异常、⾼⾎压、糖尿病等）应积极治疗。\n" +
                "5. 根据这个体检报告的内容，分别给人体的8大系统打分，每项满分为100分，8大系统分别为：呼吸系统、消化系统、内分泌系统、免疫系统、循环系统、泌尿系统、运动系统、感官系统\n" +
                "6. 给体检报告做一个总结，总结格式：体检报告中尿蛋⽩、癌胚抗原、⾎沉、空腹⾎糖、总胆固醇、⽢油三酯、低密度脂蛋⽩胆固醇、⾎清载脂蛋⽩B、动脉硬化指数、⽩细胞、平均红细胞体积、平均⾎红蛋⽩共12项指标提示异常，尿液常规共1项指标处于临界值，⾎脂、⾎液常规、尿液常规、糖类抗原、⾎清酶类等共43项指标提示正常，综合这些临床指标和数据分析：肾脏、肝胆、⼼脑⾎管存在隐患，其中⼼脑⾎管有“⾼危”⻛险；肾脏部位有“中危”⻛险；肝胆部位有“低危”⻛险。\n" +
                "\n" +
                "输出要求：\n" +
                "最后，将以上结果输出为JSON格式，不要包含其他的文字说明，所有的返回结果都是json，详细格式如下：\n" +
                "\n" +
                "{\n" +
                "  \"totalCheckDate\": \"YYYY-MM-DD\",\n" +
                "  \"healthAssessment\": {\n" +
                "    \"riskLevel\": \"healthy/caution/risk/danger/severeDanger\",\n" +
                "    \"healthIndex\": XX.XX\n" +
                "  },\n" +
                "  \"riskDistribution\": {\n" +
                "    \"healthy\": XX.XX,\n" +
                "    \"caution\": XX.XX,\n" +
                "    \"risk\": XX.XX,\n" +
                "    \"danger\": XX.XX,\n" +
                "    \"severeDanger\": XX.XX\n" +
                "  },\n" +
                "  \"abnormalData\": [\n" +
                "    {\n" +
                "      \"conclusion\": \"异常数据的结论\",\n" +
                "      \"examinationItem\": \"体检项目名称\",\n" +
                "      \"result\": \"检查结果\",\n" +
                "      \"referenceValue\": \"参考值\",\n" +
                "      \"unit\": \"单位\",\n" +
                "      \"interpret\":\"对于异常的结论进一步详细的说明\",\n" +
                "      \"advice\":\"针对于这一项的异常，给出一些健康的建议\"\n" +
                "    }\n" +
                "  ],\n" +
                "  \"systemScore\": {\n" +
                "    \"breathingSystem\": XX,\n" +
                "    \"digestiveSystem\": XX,\n" +
                "    \"endocrineSystem\": XX,\n" +
                "    \"immuneSystem\": XX,\n" +
                "    \"circulatorySystem\": XX,\n" +
                "    \"urinarySystem\": XX,\n" +
                "    \"motionSystem\": XX,\n" +
                "    \"senseSystem\": XX\n" +
                "  },\n" +
                "  \"summarize\": \"体检报告的总结\"\n" +
                "}";
        // 将提示词中的换行符替换为转义后的换行符（可能用于适配AI模型的输入格式）
        return prompt.replace("\n", "\\\\n");
    }
}