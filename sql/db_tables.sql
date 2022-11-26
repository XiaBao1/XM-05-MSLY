DROP TABLE IF EXISTS else_menu;
DROP TABLE IF EXISTS else_questionnare;
DROP TABLE IF EXISTS user_comment;
DROP TABLE IF EXISTS user_product_record;
DROP TABLE IF EXISTS user_room_record;
DROP TABLE IF EXISTS provider_product;
DROP TABLE IF EXISTS provider_room;
DROP TABLE IF EXISTS provider_landlord;
DROP TABLE IF EXISTS else_users;
DROP TABLE IF EXISTS else_roles;

CREATE TABLE else_roles (
    id INT NOT NULL AUTO_INCREMENT,

    role_name varchar(16) NOT NULL,
    number INT NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE else_users (
    account_number VARCHAR(16) NOT NULL,

    password VARCHAR(32) NOT NULL,
    username VARCHAR(16) NOT NULL, 
    gender CHAR(1) NOT NULL,      
    register_time DATETIME NOT NULL,
    province VARCHAR(16),
    email VARCHAR(32), 
    money INT NOT NULL DEFAULT 0,
    photo VARCHAR(255),
    phone varchar(16),
    role_id INT NOT NULL,

    PRIMARY KEY (account_number),
    FOREIGN KEY (role_id) REFERENCES else_roles(id)  
);

CREATE TABLE provider_landlord (
    id INT NOT NULL AUTO_INCREMENT,

    landlord_name VARCHAR(50) NOT NULL,
    host_account VARCHAR(16) NOT NULL,
    address VARCHAR(50) NOT NULL,  
    score INT,
    register_time DATETIME NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (host_account) REFERENCES else_users(account_number) 
);
CREATE TABLE provider_room (
    landlord_id INT NOT NULL,
    room_number VARCHAR(16) NOT NULL,

    price_per_day INT NOT NULL,
    standard VARCHAR(16) NOT NULL,
    is_free BOOLEAN NOT NULL,

    PRIMARY KEY (landlord_id, room_number),
    FOREIGN KEY (landlord_id) REFERENCES provider_landlord(id) 
);

CREATE TABLE provider_product (
    id int NOT NULL AUTO_INCREMENT,
    
    landlord_id INT NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL,
    inventory INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (landlord_id) REFERENCES provider_landlord(id)     
);

CREATE TABLE user_room_record (
    id int NOT NULL AUTO_INCREMENT,

    customer_account VARCHAR(16) NOT NULL,
    landlord_id INT NOT NULL,
    room_number VARCHAR(16) NOT NULL,
    check_in_date DATETIME,
    check_out_date DATETIME,
    reserve_in_date DATETIME,
    reserve_out_date DATETIME,
    price DOUBLE NOT NULL,
    is_paid BOOLEAN NOT NULL,
    is_done BOOLEAN NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (customer_account) REFERENCES else_users(account_number),
    FOREIGN KEY (landlord_id, room_number) REFERENCES provider_room(landlord_id, room_number)
);

CREATE TABLE user_product_record (
    id int NOT NULL AUTO_INCREMENT,

    customer_account VARCHAR(16) NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DOUBLE NOT NULL,
    order_time DATETIME NOT NULL,
    finish_time DATETIME,
    is_received BOOLEAN NOT NULL,
    is_paid BOOLEAN NOT NULL,
    is_done BOOLEAN NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (customer_account) REFERENCES else_users(account_number),
    FOREIGN KEY (product_id) REFERENCES provider_product(id)
);

CREATE TABLE user_comment (
    id int NOT NULL AUTO_INCREMENT,

    customer_account VARCHAR(16) NOT NULL,
    landlord_id INT NOT NULL,
    score INT NOT NULL,
    comment VARCHAR(50),
    photo VARCHAR(255),

    PRIMARY KEY (id),
    FOREIGN KEY (customer_account) REFERENCES else_users(account_number),
    FOREIGN KEY (landlord_id) REFERENCES provider_landlord(id)
);

CREATE TABLE else_questionnare (
    id int NOT NULL AUTO_INCREMENT,

    customer_account VARCHAR(16) NOT NULL,
    age INT NOT NULL,
    type VARCHAR(16) NOT NULL,
    degree VARCHAR(16) NOT NULL,
    idea VARCHAR(50),

    PRIMARY KEY (id),
    FOREIGN KEY (customer_account) REFERENCES else_users(account_number)
);

CREATE TABLE else_menu (
    id int NOT NULL AUTO_INCREMENT,

    pre_id INT,
    name VARCHAR(16) NOT NULL,
    authority_host BOOLEAN NOT NULL,
    authority_customer BOOLEAN NOT NULL,
    authority_manager BOOLEAN NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (pre_id) REFERENCES else_menu(id)
);


INSERT INTO else_roles(role_name, number) VALUES ('admin', 2);
INSERT INTO else_roles(role_name, number) VALUES ('customer', 11);
INSERT INTO else_roles(role_name, number) VALUES ('provider', 3);


INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('admin01', '123456', 'admin01', 'm', '2022-11-15 20:00:00', 1);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('admin02', '123456', 'admin02', 'f', '2022-11-15 20:00:00', 1);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('provider01', '123456', 'provider01', 'm', '2022-11-15 20:00:00', 3);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('provider02', '123456', 'provider02', 'm', '2022-11-15 20:00:00', 3);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('provider03', '123456', 'provider03', 'f', '2022-11-15 20:00:00', 3);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('customer01', '123456', 'customer01', 'm', '2022-11-15 20:00:00', 2);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('customer02', '123456', 'customer02', 'm', '2022-11-15 20:00:00', 2);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('customer03', '123456', 'customer03', 'm', '2022-11-15 20:00:00', 2);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('customer04', '123456', 'customer04', 'f', '2022-11-15 20:00:00', 2);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('customer05', '123456', 'customer05', 'f', '2022-11-15 20:00:00', 2);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('customer06', '123456', 'customer06', 'f', '2022-11-15 20:00:00', 2);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('customer07', '123456', 'customer07', 'f', '2022-11-15 20:00:00', 2);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('customer08', '123456', 'customer08', 'f', '2022-11-15 20:00:00', 2);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('customer09', '123456', 'customer09', 'f', '2022-11-15 20:00:00', 2);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('customer10', '123456', 'customer10', 'f', '2022-11-15 20:00:00', 2);
INSERT INTO else_users(account_number, password, username, gender, register_time, role_id) VALUES ('customer11', '123456', 'customer11', 'f', '2022-11-15 20:00:00', 2);


INSERT INTO provider_landlord(landlord_name, host_account, address, register_time) VALUES ('landlord01', 'provider01', 'Sichuan', '2022-11-15 20:00:00');
INSERT INTO provider_landlord(landlord_name, host_account, address, register_time) VALUES ('landlord02', 'provider02', 'Sichuan', '2022-11-15 20:00:00');
INSERT INTO provider_landlord(landlord_name, host_account, address, register_time) VALUES ('landlord03', 'provider03', 'Sichuan', '2022-11-15 20:00:00');
INSERT INTO provider_landlord(landlord_name, host_account, address, register_time) VALUES ('landlord04', 'provider03', 'Sichuan', '2022-11-15 20:00:00');

INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (1, '890790', 110, '双人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (1, '890791', 120, '单人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (1, '890792', 130, '双人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (1, '890793', 140, '三人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (2, '301', 100, '三人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (2, '102', 100, '双人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (2, '201', 100, '双人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (2, '101', 100, '单人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (3, '101', 100, '单人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (3, '102', 100, '单人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (3, '103', 100, '单人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (3, '104', 100, '单人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (4, '201', 100, '单人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (4, '202', 100, '单人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (4, '203', 100, '单人间', true);
INSERT INTO provider_room(landlord_id, room_number, price_per_day, standard, is_free) VALUES (4, '204', 100, '单人间', true);


INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (1, '兔头', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (1, '火锅底料', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (1, '凉面', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (1, '炸酱面', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (2, '兔头', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (2, '火锅底料', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (2, '凉面', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (2, '炸酱面', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (3, '兔头', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (3, '火锅底料', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (3, '凉面', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (3, '炸酱面', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (4, '兔头', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (4, '火锅底料', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (4, '凉面', '好吃的', 100, 10);
INSERT INTO provider_product(landlord_id, product_name, description, price, inventory) VALUES (4, '炸酱面', '好吃的', 100, 10);


INSERT INTO user_room_record(customer_account, landlord_id, room_number, price, is_paid, is_done) VALUES ('customer01', 1, '890790', 100, true, true);
INSERT INTO user_room_record(customer_account, landlord_id, room_number, price, is_paid, is_done) VALUES ('customer02', 1, '890791', 100, true, true);
INSERT INTO user_room_record(customer_account, landlord_id, room_number, price, is_paid, is_done) VALUES ('customer03', 1, '890792', 100, true, true);
INSERT INTO user_room_record(customer_account, landlord_id, room_number, price, is_paid, is_done) VALUES ('customer04', 2, '301', 100, true, true);
INSERT INTO user_room_record(customer_account, landlord_id, room_number, price, is_paid, is_done) VALUES ('customer05', 2, '102', 100, true, true);
INSERT INTO user_room_record(customer_account, landlord_id, room_number, price, is_paid, is_done) VALUES ('customer06', 3, '101', 100, true, true);
INSERT INTO user_room_record(customer_account, landlord_id, room_number, price, is_paid, is_done) VALUES ('customer07', 3, '101', 100, true, true);
INSERT INTO user_room_record(customer_account, landlord_id, room_number, price, is_paid, is_done) VALUES ('customer08', 3, '102', 100, true, true);
INSERT INTO user_room_record(customer_account, landlord_id, room_number, price, is_paid, is_done) VALUES ('customer09', 4, '201', 100, true, true);
INSERT INTO user_room_record(customer_account, landlord_id, room_number, price, is_paid, is_done) VALUES ('customer10', 4, '202', 100, true, true);
INSERT INTO user_room_record(customer_account, landlord_id, room_number, price, is_paid, is_done) VALUES ('customer10', 4, '203', 100, true, true);


INSERT INTO user_product_record(customer_account, product_id, quantity, price, order_time, is_received, is_paid, is_done) VALUES ('customer01', 2, 5, 100, '2022-11-14 08:00:00', true, true, true);
INSERT INTO user_product_record(customer_account, product_id, quantity, price, order_time, is_received, is_paid, is_done) VALUES ('customer02', 3, 3, 50, '2022-11-14 08:00:00', true, true, true);
INSERT INTO user_product_record(customer_account, product_id, quantity, price, order_time, is_received, is_paid, is_done) VALUES ('customer03', 4, 8, 20, '2022-11-14 08:00:00', true, true, true);

INSERT INTO user_comment(customer_account, landlord_id, score, comment) VALUES ('customer01', 1, 100, '非常好');
INSERT INTO user_comment(customer_account, landlord_id, score, comment) VALUES ('customer02', 1, 90, '很干净');
INSERT INTO user_comment(customer_account, landlord_id, score, comment) VALUES ('customer04', 2, 100, '干净又卫生');
INSERT INTO user_comment(customer_account, landlord_id, score, comment) VALUES ('customer08', 3, 100, '非常好');
INSERT INTO user_comment(customer_account, landlord_id, score, comment) VALUES ('customer09', 4, 100, '非常好');



INSERT INTO else_questionnare(customer_account, age, type, degree) VALUES ('customer01', 20, '家庭旅行', '满意');
INSERT INTO else_questionnare(customer_account, age, type, degree) VALUES ('customer02', 20, '家庭旅行', '满意');
INSERT INTO else_questionnare(customer_account, age, type, degree) VALUES ('customer03', 20, '家庭旅行', '满意');
INSERT INTO else_questionnare(customer_account, age, type, degree) VALUES ('customer04', 20, '家庭旅行', '满意');
INSERT INTO else_questionnare(customer_account, age, type, degree) VALUES ('customer05', 20, '家庭旅行', '满意');
INSERT INTO else_questionnare(customer_account, age, type, degree) VALUES ('customer06', 20, '家庭旅行', '满意');
INSERT INTO else_questionnare(customer_account, age, type, degree) VALUES ('customer07', 20, '家庭旅行', '满意');
INSERT INTO else_questionnare(customer_account, age, type, degree) VALUES ('customer08', 20, '家庭旅行', '满意');
INSERT INTO else_questionnare(customer_account, age, type, degree) VALUES ('customer09', 20, '家庭旅行', '满意');
INSERT INTO else_questionnare(customer_account, age, type, degree) VALUES ('customer10', 20, '家庭旅行', '满意');
INSERT INTO else_questionnare(customer_account, age, type, degree) VALUES ('customer10', 20, '家庭旅行', '满意');


INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (NULL, '用户管理', false, false, true);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (NULL, '民宿管理', true, true, true);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (NULL, '订单管理', true, true, true);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (NULL, '菜单管理', false, false, true);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (NULL, '代办管理', false, false, true);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (NULL, '个人管理', true, true, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (NULL, '特产管理', true, true, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (NULL, '驾驶舱页面', true, true, true);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (1, '登录用户', false, false, true);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (1, '所有用户', false, false, true);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (2, '民宿管理', false, false, true);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (2, '特产管理', false, false, true);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (2, '房间管理', false, false, true);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (3, '民宿订单', false, false, true);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (3, '农产品订单', false, false, true);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (6, '个人中心', true, true, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (6, '账号关联', true, true, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (6, '注销', true, true, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (2, '民宿查找', true, true, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (2, '热门榜单', true, true, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (2, '上传房源', true, false, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (2, '详细页面', true, true, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (7, '特产查找', true, true, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (7, '热门榜单', true, true, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (7, '上传特产', true, false, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (7, '详细页面', true, true, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (3, '民宿订单', true, true, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (3, '特产订单', true, true, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (27, '支出', true, false, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (27, '收入', true, false, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (28, '支出', true, false, false);
INSERT INTO else_menu(pre_id, name, authority_host, authority_customer, authority_manager) VALUES (28, '收入', true, false, false);


