<?php

Class Model
{
    const DATA_FILE = 'data.php';

    public static function getData()
    {
        if (is_file(self::DATA_FILE)) {
            $data = include self::DATA_FILE;
        }
        if (isset($data) && is_array($data)) {
            return $data;
        }
        die('Data file "'.self::DATA_FILE.'" is missing or invalid');
    }
}
