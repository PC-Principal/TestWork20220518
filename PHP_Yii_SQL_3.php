<?php
/**
 * Created by PhpStorm.
 * User: basil
 * Date: 19.05.2022
 * Time: 4:07
 */

/** Выполнение задания №3 PHP/Yii/SQL **/

$data = Yii::$app->db->createCommand('SELECT t2.`fms`,t3.`name` FROM user_report AS t1
LEFT JOIN `users` AS t2 ON t1.user_id = t2.users_id
LEFT JOIN project AS t3 ON t1.project_id = t3.project_id
WHERE DATE(t1.create_date) = DATE(DATE_SUB(NOW(), INTERVAL 1 DAY)) AND LENGTH(t1.content) > 200');

$arr = [];

foreach ($data as $item) {
    $arr += [$item['fms'] => $item['name']];
}

return $arr;