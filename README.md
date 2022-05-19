# Набор из 4-х тестовых заданий

В этом репозитории лежат решения по заданиям, которые будет описаны ниже. Данные задачи были получены на одном из собеседований.

## Задание №1 PHP

Напишите код на PHP, который транслирует строку 416910575238 по следующим правилам:

1 -> 8

2 -> 8

3 -> 3

4 -> 5

5 -> 6

6 -> 9

7 -> 1

8 -> 2

9 -> 3

0 -> 5

## Задание №2 SQL

Есть следующие таблицы:
```
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
```

Напишите запрос, который выведет список проектов, по которым не было отчетов в указанный день или трудоемкость указанная в отчете составила менее 1 часа.

## Задание №3 Php/Yii/Sql

Есть следующие таблицы:
```
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
```
Напишите код на Yii2 возвращающий массив, в котором в качестве ключа ФИО пользователя, в качестве значения Название проекта, при этом SQL запрос должен возвращать отчеты только за предыдущий календарный день, а длина самого отчета должна быть не менее 200 знаков.


## Задание №4 SQL

Есть следующие таблицы:

```
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
```
Напишите запрос, который выведет следующие поля:
ФИО - Название проекта - Суммарная трудоемкость

Отчет должен считаться за текущий календарный месяц, при расчете суммарной трудоемкости, если трудоемкость отчета менее 1 часа, такая трудоемкость должна быть принята за 1 час. В отчете не должны отображаться записи, если пользователь работал над проектом менее 2-х часов без применения правила округления трудоемкости меньшей часа до часа.

## Пример одного из запросов
```
SELECT t3.fms,t2.`name`,
case when SUM(t1.expence) = 0 
then 1 
else SUM(t1.expence) END AS 't1.expence_culc'  
FROM user_report AS t1  
LEFT JOIN project AS t2 ON t2.project_id = t1.project_id  
LEFT JOIN `users` AS t3 ON t3.users_id = t1.user_id  
WHERE DATE(t1.create_date) > '2022-04-30' AND DATE(t1.create_date) < '2022-06-01'  
GROUP BY t1.project_id  
HAVING NOT SUM(t1.expence) = 1;
```

**Исходники с решениями всех перечисленных задач лежат в репозитории.**