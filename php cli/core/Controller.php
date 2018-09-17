<?php

class Controller
{
    public static function start()
    {
        $data = Model::getData();
        $keys = self::_getKeys($data);

        $view = new View;
        $view->printResult($keys, $data);
    }

    private static function _getKeys($data)
    {
        $keys = [];
        foreach ($data as $row) {
            $diff = array_diff(array_keys($row), $keys);
            $keys = array_merge($keys, $diff);
        }
        sort($keys);
        return $keys;
    }
}