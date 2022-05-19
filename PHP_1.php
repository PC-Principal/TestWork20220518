<?php
/**
 * Created by PhpStorm.
 * User: basil
 * Date: 19.05.2022
 * Time: 3:05
 */

/*** Выполнение задания №1 PHP ***/

$string = '416910575238';

$strArr = str_split($string);

$converted = '';

$baseArr = [
    '1','2','3','4','5','6','7','8','9','0'
];

$replaceArr = [
    '8','8','3','5','6','9','1','2','3','5'
];

$kvArr = array_combine($baseArr,$replaceArr);

foreach ($strArr as $i) {
    $converted.=$kvArr[$i];
}

return $converted;