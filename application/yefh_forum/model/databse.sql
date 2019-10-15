-- 1711140136-创建数据库
create database yefh_forum;
create database yefh_forum_admin;



-- 1711140136-创建表
/* 
存储用户信息表
unick 用户昵称
upa 用户密码
uemail 邮箱地址
utel 电话
*/
use yefh_forum;
create table yefh_user
(
  unick varchar(10) primary key not null,
  upa char(32) not null,
  uemail varchar(35) not null,
  utel varchar(15) not null
);
-- 1711140136测试数据
insert into yefh_user
  (unick,upa,uemail,utel)
values
  ('tom', md5('123456'), '508766975@qq.com', '17876383171');

/*
创建存储板块信息
sid 板块编号
sname 板块名称
sremark 板块说明
*/
use yefh_forum;
create table yefh_section
(
  sid int primary key auto_increment not null,
  sname varchar(20) not null,
  sremark varchar(50) not null
);



/*
存储原贴信息
mid 帖子编号
mtitle 帖子标题
mcontent 内容
unick 作者
mcreateat 创建时间
sid 板块编号
*/
use yefh_forum;
create table yefh_mes
(
  mid int primary key auto_increment not null,
  mtitle varchar(30) not null,
  mcontent text not null,
  unick varchar(10) not null,
  mcreateat int not null,
  sid int not null,
  FOREIGN KEY(unick) REFERENCES yefh_user(unick),
  FOREIGN KEY(sid) REFERENCES yefh_section(sid)
);


/*
创建存储回复信息
rid 回复编号
rcontent 内容
unick 作者
rcreateat 创建时间
mid 原贴编号
*/
use yefh_forum;
create table yefh_res
(
  rid int primary key not null,
  rcontent text not null,
  unick varchar(10) not null,
  rcreateat int not null,
  mid int not null,
  FOREIGN KEY(unick) REFERENCES yefh_user(unick),
  FOREIGN KEY(mid) REFERENCES yefh_mes(mid)
);


-- 1711140136读写账号(老版本写法)
-- grant select
--   on yefh_forum.*
--   to "read"@"localhost"
--   identified by "87654321";
-- 新版本写法
CREATE USER 'read'@'localhost' IDENTIFIED BY '87654321';
GRANT SELECT ON yefh_forum.* TO 'read'@'localhost';
ALTER USER 'read'@'localhost' IDENTIFIED BY '87654321' PASSWORD EXPIRE NEVER;   #修改加密规则
ALTER USER 'read'@'localhost' IDENTIFIED WITH mysql_native_password BY '87654321'; #更新一下用户的密码

-- 1711140136修改账号(老版本写法)
-- grant insert,update,select
--   on yefh_forum.*
--   to "change"@"localhost" 
--   identified by "66666666";
-- 新版本写法
CREATE USER 'change'@'localhost' IDENTIFIED BY '66666666';
GRANT INSERT,UPDATE,SELECT ON yefh_forum.* TO 'change'@'localhost';
ALTER USER 'change'@'localhost' IDENTIFIED BY '66666666' PASSWORD EXPIRE NEVER;   #修改加密规则
ALTER USER 'change'@'localhost' IDENTIFIED WITH mysql_native_password BY '66666666'; #更新一下用户的密码


-- 1711140136创建后台用户(老版本写法)
-- grant insert,update,select 
--   on yefh_forum_admin.*
--   to "admin_change"@"localhost"
--   identified by "12345678";
-- 新版本写法
CREATE USER 'admin_change'@'localhost' IDENTIFIED BY '12345678';
GRANT INSERT,UPDATE,SELECT ON yefh_forum.* TO 'admin_change'@'localhost';
ALTER USER 'admin_change'@'localhost' IDENTIFIED BY '12345678' PASSWORD EXPIRE NEVER;   #修改加密规则
ALTER USER 'admin_change'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345678'; #更新一下用户的密码


-- 1711140136-删除用户
DROP USER 'read'@'localhost';
DROP USER 'change'@'localhost';
DROP USER 'admin_change'@'localhost';


-- 1711140136-查看用户
SELECT DISTINCT
  CONCAT( 'User: ''', USER, '''@''', HOST, ''';' ) AS QUERY
FROM
  mysql.USER;

-- 插数据进板块
insert into yefh_section
    (sname,sremark)
    values
    ('MUI专区','MUI专区'),
    ('科技专区','科技专区'),
    ('刷机教程','刷机教程')

