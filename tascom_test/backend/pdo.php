<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 6/28/18
 * Time: 12:03 PM
 */

$pdo = new PDO("mysql:host=db;dbname=tascom_test", 'root', 'root');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
