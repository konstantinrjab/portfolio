<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <title>Document</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <h3 class="text-center">Рябченко тестовое на Junior PHP</h3>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <h3 class="text-center">SQL</h3>
            <h4>Уровень 1</h4>
            <p class="font-weight-bold">Задание 1</p>
            <p>SELECT id, lastName FROM visitors</p>

            <p class="font-weight-bold">Задание 2</p>
            <p>SELECT * FROM visitors WHERE name = 'Саша'</p>

            <p class="font-weight-bold">Задание 3</p>
            <p> SELECT * FROM visitors
                WHERE name LIKE '%иван%' OR lastName LIKE '%иван%' OR middleName LIKE '%иван%'</p>

            <p class="font-weight-bold">Задание 4</p>
            <p>SELECT * FROM visitors
                ORDER BY lastName DESC, name DESC, middleName DESC</p>

            <p class="font-weight-bold">Задание 5</p>
            <p>SELECT id, lastName, name
                FROM visitors ORDER BY id DESC LIMIT 1</p>

            <p class="font-weight-bold">Задание 6</p>
            <p>SELECT * FROM visitors as v WHERE v.creationDate >= ( CURDATE() - INTERVAL 3 DAY )</p>

            <h4>Уровень 2</h4>

            <p class="font-weight-bold">Задание 1</p>
            <pre>SELECT id, lastName, name FROM visitors as v
    JOIN visitors_groups as vg ON v.id = vg.visitorId
    WHERE vg.groupId = 52
    ORDER BY lastName, name</pre>

            <p class="font-weight-bold">Задание 2</p>
            <pre>SELECT id, lastName, name
    FROM visitors as v
    JOIN visitors_groups as vg ON v.id = vg.visitorId
    WHERE vg.groupId = 52 ORDER BY id DESC, lastName, name LIMIT 1</pre>

            <p class="font-weight-bold">Задание 3</p>
            <pre>SELECT g.name, COUNT(v.id) as count
    FROM groups as g
    JOIN visitors_groups as vg ON g.id = vg.groupId
    JOIN visitors as v ON vg.visitorId = v.id
    GROUP BY g.name
    ORDER BY count DESC</pre>

            <p class="font-weight-bold">Задание 4</p>
            <pre>SELECT g.id, g.name as 'Название группы',
    CONCAT(v.lastName, ' ', v.name, ' ', v.middleName) as 'Фамилия Имя посетителя'
    FROM groups as g
    JOIN visitors_groups as vg ON g.id = vg.groupId
    JOIN visitors as v ON vg.visitorId = v.id
    ORDER BY g.name, v.name</pre>

            <p class="font-weight-bold">Задание 5</p>
            <pre>SELECT g.id, g.name
    FROM groups as g
    JOIN visitors_groups as vg ON g.id = vg.groupId
    JOIN visitors as v ON vg.visitorId = v.id
    GROUP BY g.id, g.name
    HAVING COUNT(v.id) = 0</pre>

            <p class="font-weight-bold">Задание 6</p>
            <pre>SELECT *
    FROM visitors as v
    JOIN visitors_groups as vg ON v.id = vg.visitorId
    JOIN groups as g ON vg.groupId = g.id
    JOIN class_types as c ON g.classTypeId = c.id
    WHERE c.id = 4
    GROUP BY g.id, v.id
    ORDER BY v.lastName, v.name, v.middleName
</pre>
            <h4>Уровень 3</h4>
            <p>Задание 1</p>
            <pre>SELECT c.name as 'Название направления', g.name as 'Название Группы',
CONCAT(v.lastName, ' ', v.name, ' ', v.middleName) as 'Фамилия Имя посетителя'
    FROM visitors as v
    JOIN visitors_groups as vg ON v.id = vg.visitorId
    JOIN groups as g ON vg.groupId = g.id
    JOIN class_types as c ON g.classTypeId = c.id
    GROUP BY c.name, g.id, v.id
    ORDER BY c.name, g.name, v.lastName, v.name, v.middleName
            </pre>

            <p>Задание 2</p>
            <pre>SELECT CONCAT(v.lastName, ' ', v.name, ' ', v.middleName) as 'Фамилия Имя посетителя',
COUNT(g.id) as count
    FROM visitors as v
    JOIN visitors_groups as vg ON v.id = vg.visitorId
    JOIN groups as g ON vg.groupId = g.id
    GROUP BY v.name, v.lastName, v.middleName
    HAVING count >= 2
            </pre>

            <p>Задание 3</p>
            <pre>SELECT CONCAT(v.lastName, ' ', v.name, ' ', v.middleName) as 'Фамилия Имя посетителя',
 GROUP_CONCAT(g.name SEPARATOR ', ') as groups
    FROM visitors as v
    JOIN visitors_groups as vg ON v.id = vg.visitorId
    JOIN groups as g ON vg.groupId = g.id
    GROUP BY  v.name, v.lastName, v.middleName
    LIMIT 10
</pre>
        </div>
    </div>


    <div class="row">
        <div class="col">
            <h3 class="text-center">PHP, JS, Jquery</h3>
            <p class="font-weight-bold">Задание 1</p>
            <p>$string = '14.07.2016 15:35';</p>
            <p>$toSave = strtotime('-3 hours', strtotime($string));</p>
            <?php
            $string = '14.07.2016 15:35';
            $toSave = strtotime('-3 hours', strtotime($string));
            ?>
            <p>На запись в бд: <?= $toSave; ?></p>
            <hr>
            <p>$timestampFromServer = '1468499700'; // 15:35 </p>
            <p>$toDisplay = date('d-m-Y H:i:s', strtotime('+3 hours', $timestampFromServer));</p>
            <?php
            $timestampFromServer = '1468499700'; // 15:35
            $toDisplay = date('d-m-Y H:i:s', strtotime('+3 hours', $timestampFromServer));
            ?>
            <p>Показать с бд:<?= $toDisplay; ?></p>

            <p class="font-weight-bold">Задание 2</p>
            <?php
            $peaches = array(
                array(
                    'color' => 'pink',
                    'size' => 8
                ),
                array(
                    'color' => 'red',
                    'size' => 10
                ),
                array(
                    'color' => 'orange',
                    'size' => 6
                ),
                array(
                    'color' => 'green',
                    'size' => 4
                ),
            );

            foreach ($peaches as $key => &$peach) {
                $peach['isBig'] = ($peach['size'] >= 8 ? true : false);
            }
            echo '<pre>';
            var_dump($peaches);
            echo '</pre>';
            ?>

            <p class="font-weight-bold">Задание 3</p>
            <?php
            $cats = [
                "Electronics" => [
                    "Phones" => [
                        "Mobile Phones",
                        "Satellite Phones"
                    ],
                    "Tablets" => [
                        "6 inch",
                        "7 inch",
                        "9 inch"
                    ],
                    "Kids Toys",
                ],
                "Spare Parts" => [
                    "Wheels" => [
                    ],
                    "Brakes" => [
                        'fv'
                    ],
                    "Discs" => [
                        'dv'
                    ],
                    "Transmission"
                ],
            ];
            echo '<pre>';
            printTree($cats);

            function printTree($array, $level = 0)
            {
                foreach ($array as $key => $value) {
                    //If $value is an array.
                    if (is_array($value)) {
                        $keys = array_keys($array);
                        echo str_repeat("-", $level), $key, '<br>';
                        //We need to loop through it.
                        printTree($value, $level + 1);
                    } else {
                        //It is not an array, so print it out.
                        echo str_repeat("-", $level), $value, '<br>';
                    }
                }
            }

            echo '</pre>';
            ?>
            <p class="font-weight-bold">Задание 4</p>
            <p class="text-muted">наверное имелось в виду сделать disabled, но я сделал как написано</p>
            <input type="checkbox">
            <input type="text" id="field1">
            <input type="text" id="field2">
            <script>
                $('input[type="checkbox"]').on('click', function () {
                    ($(this).is(':checked') ? $('#field1').focus() : $('#field2').focus())
                });
            </script>

            <p class="font-weight-bold">Задание 5</p>
            <input class="js-values" type="text" value="1">
            <input class="js-values" type="text" value="6">
            <input class="js-values" type="text" value="3">
            <input class="js-values" type="text" value="19">
            <input class="js-values2" type="text" value="54">
            <input class="js-values2" type="text" value="5">
            <input class="js-values2" type="text" value=72">
            <input class="js-values2" type="text" value="7">
            <div id="task5"></div>
            <script>
                let group = [];
                let group2 = [];
                $('.js-values').each(function () {
                    group.push($(this).val());
                });
                $('.js-values2').each(function () {
                    group2.push($(this).val());
                });
                let resultDiv = $('#task5');
                resultDiv.append('Group 1: ');

                $.each(group, function () {
                    resultDiv.append(this).append('; ');
                });
                resultDiv.append('<br>Group 2: ');

                $.each(group2, function () {
                    resultDiv.append(this).append(';');
                });

            </script>
            <p class="font-weight-bold">Задание 6</p>
            <pre>
interface Api
{
    getSettings();
    connect ();
    convert ($response);
    getCurrency ();
}
class Controller
{
    __construct() {
        $this->getAverage() //точка входа
    }
    getEach($url){
        // форичем создаем обьекты ApiFirst, ApiSecond
        // и вызываем у них методы getCurrency()
        // результаты записываем в $prices[]
        return $prices;
    }
    getAverage(){
        // $prices = $this->getEach();
        // считаем $result так как необходимо
        // $model->insert($tableName, $result);
    }
}
class ApiFirst implements Api
{
    private $currencyKey = 'pairName';
    private $courseKey = 'price';
    private $settings = [url, pass etc]; // данные которые помогут взять сеттинги с бд

    getSettings() {
        $model->select($tableName, $this->settings);
    }
    connect() {
        // используем $this->getSettings()
        return $response;
    }
    convert ($response) {
        $response = $this->connect();
        // парсим json, используем $this->currencyKey и $this->courseKey.
        return $data
    }
    getCurrency () {
        // что то еще
        return $this->convert();
    }
}
class ApiSecond implements Api
{
    private currencyKey = 'currency';
    private courseKey = 'course';
    private $settings = [url, pass etc];

    // по аналогии с ApiFirst
    getSettings() { ... }
    connect () { ... }
    convert ($response) { ... }
    getCurrency () { ... }
}
class Model
{
    insert($table, $data) { return boolean; }
    select($table, $condition) { return $data; }
}
</pre>
        </div>
    </div>
</div>
</body>
</html>