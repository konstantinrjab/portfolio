<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 6/27/18
 * Time: 6:59 PM
 */

session_start();
if (!empty($_POST['login']) || !empty($_POST['password'])) {
    if ($_POST['login'] == 'admin' && $_POST['password'] == 'admin') {
        unset($_SESSION['message']);
        $_SESSION['login'] = true;
    } else {
        $_SESSION['message'] = 'Неправильный логин или пароль. Попробуйте admin/admin';
    }
    header("Refresh:0");
}

if (!empty($_POST['logout'])) {
    $_SESSION['login'] = false;
    header("Refresh:0");
}

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <title>Рябченко</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <h2 class="text-center mt-3 mb-3">Рябченко тестовое</h2>
        </div>
    </div>
    <?php if (!empty($_SESSION['message'])) : ?>
        <p class="text-danger text-center"><?= $_SESSION['message'] ?></p>
    <?php endif; ?>
    <?php if ($_SESSION['login'] !== true): ?>
        <div class="row">
            <div class="col-12">
                <form method="post">
                    <div class="form-group">
                        <label for="login">Логин: admin</label>
                        <input name="login" type="text" class="form-control" id="login" placeholder="Введите логин">
                    </div>
                    <div class="form-group">
                        <label for="password">Пароль: admin</label>
                        <input name="password" type="password" class="form-control" id="password"
                               placeholder="Введите пароль">
                    </div>
                    <button type="submit" class="btn btn-primary">Войти</button>
                </form>
            </div>
        </div>
    <?php else: ?>

        <div class="row mb-5">
            <div class="col-9">
                <label for="days_count">На сколько дней строить графики</label>
                <input type="number" id="days_count" value="10" min="0" max="100">
                <br>
                <label for="date">С какого числа</label>
                <input type="date" id="date" value="2017-07-01">
                <br>
                <button class="btn btn-success" type="button" onclick="build()">Построить</button>
            </div>
            <div class="col-3">
                <form method="post">
                    <input name="logout" type="submit" class="btn btn-info" value="Выйти">
                </form>
            </div>
        </div>
    <div class="row">
        <div class="col-12">
            <div id="charts-container">

            </div>
        </div>
    </div>
    <?php endif; ?>
</div>
</body>
</html>
