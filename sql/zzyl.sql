create database if not exists zzyl;
use zzyl;

-- 护理项目表
CREATE TABLE `nursing_project`
(
    `id`                  bigint   NOT NULL AUTO_INCREMENT COMMENT '编号',
    `name`                varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '名称',
    `order_no`            int                                                           DEFAULT NULL COMMENT '排序号',
    `unit`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '单位',
    `price`               decimal(10, 2)                                                DEFAULT NULL COMMENT '价格',
    `image`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片',
    `nursing_requirement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '护理要求',
    `status`              int      NOT NULL                                             DEFAULT '1' COMMENT '状态（0：禁用，1：启用）',
    `create_by`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '创建人',
    `update_by`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '更新人',
    `remark`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
    `create_time`         datetime NOT NULL                                             DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         datetime                                                      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 84
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='护理项目表';

-- 护理项目计划关系表
CREATE TABLE `nursing_project_plan`
(
    `id`                bigint                                                       NOT NULL AUTO_INCREMENT,
    `plan_id`           bigint                                                       NOT NULL COMMENT '计划id',
    `project_id`        bigint                                                       NOT NULL COMMENT '项目id',
    `execute_time`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '计划执行时间',
    `execute_cycle`     int                                                          NOT NULL COMMENT '执行周期 0 天 1 周 2月',
    `execute_frequency` int                                                          NOT NULL COMMENT '执行频次',
    `create_time`       datetime                                                     NOT NULL COMMENT '创建时间',
    `update_time`       datetime                                                      DEFAULT NULL COMMENT '更新时间',
    `create_by`         bigint                                                        DEFAULT NULL COMMENT '创建人id',
    `update_by`         bigint                                                        DEFAULT NULL COMMENT '更新人id',
    `remark`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1727
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='护理计划和项目关联表';

-- 护理计划表
CREATE TABLE `nursing_plan`
(
    `id`          bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '编号',
    `sort_no`     int                                                                    DEFAULT NULL COMMENT '排序号',
    `plan_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
    `status`      tinyint                                                       NOT NULL DEFAULT '0' COMMENT '状态 0禁用 1启用',
    `create_time` datetime                                                      NOT NULL COMMENT '创建时间',
    `update_time` datetime                                                               DEFAULT NULL COMMENT '更新时间',
    `create_by`   bigint                                                                 DEFAULT NULL COMMENT '创建人id',
    `update_by`   bigint                                                                 DEFAULT NULL COMMENT '更新人id',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `plan_name` (`plan_name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 129
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='护理计划表';

-- 护理等级表
CREATE TABLE `nursing_level`
(
    `id`          bigint                                                       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '等级名称',
    `lplan_id`    bigint                                                       NOT NULL COMMENT '护理计划ID',
    `fee`         decimal(10, 2)                                               NOT NULL COMMENT '护理费用',
    `status`      tinyint(1)                                                   NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：启用）',
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '等级说明',
    `create_time` datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `create_by`   bigint                                                                DEFAULT NULL COMMENT '创建人id',
    `update_by`   bigint                                                                DEFAULT NULL COMMENT '更新人id',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL COMMENT '备注',
    `update_time` datetime                                                              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 76
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='护理等级表';

-- 菜单 SQL


INSERT INTO `sys_menu` VALUES (2000, '服务管理', 0, 0, 'serve', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'tool', 'admin', '2025-07-12 19:50:28', '', NULL, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理项目', '2000', '1', 'project', 'serve/project/index', 1, 0, 'C', '0', '0', 'serve:project:list', '#',
        'admin', sysdate(), '', null, '护理项目菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理项目查询', @parentId, '1', '#', '', 1, 0, 'F', '0', '0', 'serve:project:query', '#', 'admin', sysdate(),
        '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理项目新增', @parentId, '2', '#', '', 1, 0, 'F', '0', '0', 'serve:project:add', '#', 'admin', sysdate(), '',
        null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理项目修改', @parentId, '3', '#', '', 1, 0, 'F', '0', '0', 'serve:project:edit', '#', 'admin', sysdate(), '',
        null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理项目删除', @parentId, '4', '#', '', 1, 0, 'F', '0', '0', 'serve:project:remove', '#', 'admin', sysdate(),
        '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理项目导出', @parentId, '5', '#', '', 1, 0, 'F', '0', '0', 'serve:project:export', '#', 'admin', sysdate(),
        '', null, '');

-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理计划', '2000', '1', 'plan', 'serve/plan/index', 1, 0, 'C', '0', '0', 'serve:plan:list', '#', 'admin',
        sysdate(), '', null, '护理计划菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理计划查询', @parentId, '1', '#', '', 1, 0, 'F', '0', '0', 'serve:plan:query', '#', 'admin', sysdate(), '',
        null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理计划新增', @parentId, '2', '#', '', 1, 0, 'F', '0', '0', 'serve:plan:add', '#', 'admin', sysdate(), '',
        null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理计划修改', @parentId, '3', '#', '', 1, 0, 'F', '0', '0', 'serve:plan:edit', '#', 'admin', sysdate(), '',
        null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理计划删除', @parentId, '4', '#', '', 1, 0, 'F', '0', '0', 'serve:plan:remove', '#', 'admin', sysdate(), '',
        null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理计划导出', @parentId, '5', '#', '', 1, 0, 'F', '0', '0', 'serve:plan:export', '#', 'admin', sysdate(), '',
        null, '');

-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理等级', '2000', '1', 'level', 'serve/level/index', 1, 0, 'C', '0', '0', 'serve:level:list', '#', 'admin',
        sysdate(), '', null, '护理等级菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理等级查询', @parentId, '1', '#', '', 1, 0, 'F', '0', '0', 'serve:level:query', '#', 'admin', sysdate(), '',
        null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理等级新增', @parentId, '2', '#', '', 1, 0, 'F', '0', '0', 'serve:level:add', '#', 'admin', sysdate(), '',
        null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理等级修改', @parentId, '3', '#', '', 1, 0, 'F', '0', '0', 'serve:level:edit', '#', 'admin', sysdate(), '',
        null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理等级删除', @parentId, '4', '#', '', 1, 0, 'F', '0', '0', 'serve:level:remove', '#', 'admin', sysdate(), '',
        null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status,
                      perms, icon, create_by, create_time, update_by, update_time, remark)
values ('护理等级导出', @parentId, '5', '#', '', 1, 0, 'F', '0', '0', 'serve:level:export', '#', 'admin', sysdate(), '',
        null, '');

-- 修改护理等级表中id字段的注释为“编号”
ALTER TABLE `nursing_level`
    MODIFY COLUMN `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号';

-- 护理项目表：取消时间自动填充
ALTER TABLE `nursing_project`
    MODIFY COLUMN `create_time` datetime NOT NULL COMMENT '创建时间',
    MODIFY COLUMN `update_time` datetime COMMENT '更新时间';

-- 护理项目计划关系表：取消时间自动填充
ALTER TABLE `nursing_project_plan`
    MODIFY COLUMN `create_time` datetime NOT NULL COMMENT '创建时间',
    MODIFY COLUMN `update_time` datetime COMMENT '更新时间';

-- 护理计划表：取消时间自动填充
ALTER TABLE `nursing_plan`
    MODIFY COLUMN `create_time` datetime NOT NULL COMMENT '创建时间',
    MODIFY COLUMN `update_time` datetime COMMENT '更新时间';

-- 护理等级表：取消时间自动填充
ALTER TABLE `nursing_level`
    MODIFY COLUMN `create_time` datetime NOT NULL COMMENT '创建时间',
    MODIFY COLUMN `update_time` datetime COMMENT '更新时间';

INSERT INTO `sys_dict_type` VALUES (100, '护理项目状态', 'nursing_project_status', '0', 'admin', '2025-07-12 20:45:37', '', NULL, '1--启用\n0--停用');
INSERT INTO `sys_dict_type` VALUES (101, '护理计划状态', 'nursing_plan_status', '0', 'admin', '2025-07-12 20:47:02', '', NULL, '1--启用\n2--停用');
INSERT INTO `sys_dict_type` VALUES (102, '护理等级状态', 'nursing_level_status', '0', 'admin', '2025-07-12 20:47:25', '', NULL, '1--启用\n2--停用');


INSERT INTO `sys_dict_data` VALUES (100, 0, '启用', '1', 'nursing_project_status', NULL, 'default', 'N', '0', 'admin', '2025-07-12 20:48:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '禁用', '0', 'nursing_project_status', NULL, 'default', 'N', '0', 'admin', '2025-07-12 20:49:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '启用', '1', 'nursing_plan_status', NULL, 'default', 'N', '0', 'admin', '2025-07-12 20:49:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '禁用', '0', 'nursing_plan_status', NULL, 'default', 'N', '0', 'admin', '2025-07-12 20:49:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '启用', '1', 'nursing_level_status', NULL, 'default', 'N', '0', 'admin', '2025-07-12 20:50:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '禁用', '0', 'nursing_level_status', NULL, 'default', 'N', '0', 'admin', '2025-07-12 20:50:20', '', NULL, NULL);
