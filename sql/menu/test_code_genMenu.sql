-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('代码生成测试', '2000', '1', '/yk/test_code_gen', 'C', '0', 'yk:test_code_gen:view', '#', 'admin', sysdate(), '', null, '代码生成测试菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('代码生成测试查询', @parentId, '1',  '#',  'F', '0', 'yk:test_code_gen:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('代码生成测试新增', @parentId, '2',  '#',  'F', '0', 'yk:test_code_gen:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('代码生成测试修改', @parentId, '3',  '#',  'F', '0', 'yk:test_code_gen:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('代码生成测试删除', @parentId, '4',  '#',  'F', '0', 'yk:test_code_gen:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('代码生成测试导出', @parentId, '5',  '#',  'F', '0', 'yk:test_code_gen:export',       '#', 'admin', sysdate(), '', null, '');
