<?php
//https://api.github.com/search/repositories?q=tetris+language:assembly&sort=stars&order=desc
//var_dump($_POST);
if (!empty($_POST['submit'])) {

    for ($i = 0; $i < 3; $i++) {
        if (!empty($_POST["value_$i"]) && !empty($_POST["operator_$i"] && !empty($_POST["value_$i"]))) {
            if ($_POST["field_$i"] == 'forks') {
                $fork = true;
                $fork_val = $_POST["value_$i"];
                $fork_operator = $_POST["operator_$i"] == '=' ? '' : $_POST["operator_$i"];
            }
            if ($_POST["field_$i"] == 'size') {
                $size = true;
                $size_val = $_POST["value_$i"];
                $size_operator = $_POST["operator_$i"];
            }
            if ($_POST["field_$i"] == 'stars') {
                $stars = true;
                $stars_val = $_POST["value_$i"];
                $stars_operator = $_POST["operator_$i"];
            }
            if ($_POST["field_$i"] == 'followers') {
                $followers = true;
                $followers_val = $_POST["value_$i"];
                $followers_operator = $_POST["operator_$i"];
            }
        }
    }

    $url = 'https://api.github.com/search/repositories?q=language:php';
    if ($fork) {
        $url .= '+forks:';
        $url .= $fork_operator;
        $url .= $fork_val;
    }
    if ($stars) {
        $url .= '+stars:';
        $url .= $stars_operator;
        $url .= $stars_val;
    }
    if ($size) {
        $url .= '+size:';
        $url .= $size_operator;
        $url .= $size_val;
    }
    if ($followers) {
        $url .= '+followers:';
        $url .= $followers_operator;
        $url .= $followers_val;
    }
    $url .= '&order=desc';
    if ($curl = curl_init()) {
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_USERAGENT, 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.9) Gecko/20100508 SeaMonkey/2.0.4');
        $response = curl_exec($curl);
        curl_close($curl);
    }
    $response = json_decode($response);
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
    <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous">
    </script>
    <!--    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>-->
    <script type="text/javascript" src="js/main.js"></script>
    <title>Document</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <?php if (isset($url)) : ?>
                <p>Requested URL: <?= $url ?></p>
            <?php endif; ?>
            <div class="rules">
                <form action="" method="post" id="form">

                    <div class="rule" id="rule_0">
                        <select name="field_0" id="">
                            <option value="size" selected="selected">size</option>
                            <option value="forks">forks</option>
                            <option value="stars">stars</option>
                            <option value="followers">followers</option>
                        </select>
                        <select name="operator_0" id="">
                            <option value=">" selected="selected">></option>
                            <option value="<"><</option>
                            <option value="=">=</option>
                        </select>
                        <input type="text" name="value_0" placeholder="Value">

                        <button type="button" class="btn btn-danger" onclick="deleteRow(0)">Delete</button>
                    </div>

                    <input type="submit" name="submit" class="btn btn-info" value="Apply">
                    <button type="button" class="btn btn-success" onclick="addRow()">Add rule</button>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12" id="response">
            <?php if(isset($response->items)) : ?>
                <?php foreach ($response->items as $r) : ?>
                    <p><a href="<?= $r->html_url ?>">Name: <?= $r->name ?></a></p>
                    <p>Size: <?= $r->size ?></p>
                    <p>Forks: <?= $r->forks_count ?></p>
                    <p>Stars: <?= $r->stargazers_count ?></p>
                    <p>Followers: <?= $r->watchers_count ?></p>
                    <hr>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
    </div>
</div>

</body>
</html>