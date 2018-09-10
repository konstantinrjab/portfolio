<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 6/28/18
 * Time: 11:51 AM
 */

require_once('pdo.php');

header('Content-Type: application/json');

if (empty($_POST['forma']) || $_POST['days_count'] < 1 || empty($_POST['start_date'])) {
    return false;
} else {
    echo getData($pdo, $_POST['forma'], $_POST['days_count'], $_POST['start_date']);
}
function getData(PDO $pdo, $forma, $days_count, $start_date)
{
    for ($i = 0; $i < $days_count; $i++) {
        $current_date = new DateTime($start_date);
        $current_date->add(new DateInterval('P' . $i . 'D'));
        $current_date = $current_date->format('Y-m-d');
        $categories[] = $current_date;

        $stmt = $pdo->prepare("SELECT *
 FROM SCPF_DATA
 JOIN CLID_DATA C2 on SCPF_DATA.ID_CLID = C2.ID_CLID
 WHERE (DATEOPEN = :date OR DATECLOSE = :date) AND C2.FORMA = :forma");
        $stmt->execute([
            ':date' => $current_date,
            ':forma' => $forma,
        ]);
        $data[$current_date] = $stmt->fetchAll(PDO::FETCH_OBJ);
    }
    foreach ($data as $date => $item) {
        $count_close = 0;
        $count_open_branch =0;
        $count_open_site = 0;

        foreach ($item as $i) {
            if ($i->DATEOPEN == $date && $i->SOURCE_OPEN == 'SITE') {
                $count_open_site++;
            }
            if ($i->DATEOPEN == $date && $i->SOURCE_OPEN == 'BRANCH') {
                $count_open_branch++;
            }
            if ($i->DATECLOSE == $date) {
                $count_close--;
            }
        }
        $series_open_site[] = $count_open_site;
        $series_open_branch[] = $count_open_branch;
        $series_close[] = $count_close;
    }

    $response['series_open_site'] = $series_open_site;
    $response['series_open_branch'] = $series_open_branch;
    $response['series_close'] = $series_close;
    $response['categories'] = $categories;

    return json_encode($response);
}