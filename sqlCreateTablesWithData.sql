/* Sql file */

CREATE TABLE `users` (
	users_id SERIAL COMMENT 'Идентификатор',
	fms VARCHAR(100) NOT NULL COMMENT 'ФИО',
	is_disabled BOOL COMMENT 'Отключен'
);

CREATE TABLE project(
	project_id SERIAL COMMENT 'Идентификатор',
	`name` VARCHAR(100) NOT NULL COMMENT 'Название',
	description text NOT NULL COMMENT 'Описание'
);

CREATE TABLE user_report(
	user_report_id SERIAL COMMENT 'Идентификатор',
	user_id INTEGER NOT NULL COMMENT 'Пользователь',
	project_id INTEGER NOT NULL COMMENT 'Проект',
	content TEXT NOT NULL COMMENT 'Отчет',
	expence INT NOT NULL COMMENT 'Трудоемкость в часах',
	create_date TIMESTAMP DEFAULT NOW() COMMENT 'Дата'
);

/* Set data into projects table */
INSERT INTO project VALUES (1,'TestPrj1','Descr1');
INSERT INTO project VALUES (2,'TestPrj2','Descr2');
INSERT INTO project VALUES (3,'TestPrj3','Descr3');
INSERT INTO project VALUES (4,'TestPrj4','Descr4');
INSERT INTO project VALUES (5,'TestPrj5','Descr5');

/* Set data into users table */
INSERT INTO `users` (users_id,fms) VALUES (1,'FIO1');
INSERT INTO `users` (users_id,fms) VALUES (2,'FIO2');
INSERT INTO `users` (users_id,fms) VALUES (3,'FIO3');
INSERT INTO `users` (users_id,fms) VALUES (4,'FIO4');
INSERT INTO `users` (users_id,fms) VALUES (5,'FIO5');

/* Set data into user_report (Custom rows) */
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (1,2,2,'Othet1',12,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (2,5,4,'Othet2',3,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (3,2,4,'Othet3',1,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (4,3,3,'Othet4',2,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (5,3,4,'Othet5',8,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (6,4,5,'Othet6',0,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (7,5,1,'Othet7',2,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (8,1,5,'Othet8',23,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (9,3,1,'Othet9',19,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (10,4,4,'Othet10',0,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (11,2,4,'Othet11',12,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (12,3,1,'Othet12',2,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (13,5,5,'Othet13',6,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (14,3,5,'Othet14',8,'2022-05-17 22:38:55');
INSERT INTO `user_report` (user_report_id,user_id,project_id,content,expence,create_date) VALUES (15,1,1,'Othet15',1,NOW());


/* Запрос на задание №3 PHP/Yii/SQL */
SELECT t2.`fms`,t3.`name` FROM user_report AS t1
LEFT JOIN `users` AS t2 ON t1.user_id = t2.users_id
LEFT JOIN project AS t3 ON t1.project_id = t3.project_id
WHERE DATE(t1.create_date) = DATE(DATE_SUB(NOW(), INTERVAL 1 DAY)) AND LENGTH(t1.content) > 200;


/* Запрос на задание SQL №2 */
SELECT t1.`name` FROM project AS t1 WHERE t1.project_id 
IN (SELECT t2.project_id FROM user_report AS t2 WHERE DATE(t2.create_date) = '2022-05-17' AND t2.expence < 1)
OR t1.project_id
NOT IN (SELECT t3.project_id FROM user_report AS t3 WHERE DATE(t3.create_date) = '2022-05-17');


/* Запрос на задание SQL №4 */
SELECT t3.fms,t2.`name`,case when SUM(t1.expence) = 0 then 1 
ELSE SUM(t1.expence) END AS 't1.expence_culc'
FROM user_report AS t1
LEFT JOIN project AS t2 ON t2.project_id = t1.project_id
LEFT JOIN `users` AS t3 ON t3.users_id = t1.user_id
WHERE DATE(t1.create_date) > '2022-04-30' AND DATE(t1.create_date) < '2022-06-01'
GROUP BY t1.project_id
HAVING NOT SUM(t1.expence) = 1;

