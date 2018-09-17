<?php

class View
{
    private $_tableWidth;
    private $_border = '|';

    public function printResult($keys, $data)
    {
        $columns = [];
        foreach ($keys as $key) {
            $columns[$key] = $this->_getColumnLength($key, $data);
        }
        $this->_tableWidth = array_sum($columns) + count($columns) + 1;

        $this->_printHead($columns);
        $this->_printBody($columns, $data);
    }

    private function _printLine($newLine = true, $bold = true)
    {
        if ($newLine) {
            echo "\n";
        }
        $symbol = ($bold ? '=' : '-');
        echo str_repeat($symbol, $this->_tableWidth);
        echo "\n";
    }

    private function _printHead($columns)
    {
        $this->_printLine();
        echo $this->_border;
        foreach ($columns as $name => $length) {
            self::_printCell($length, $name);
        }
        $this->_printLine(true, false);
    }

    private function _printBody($columns, $data)
    {
        foreach ($data as $row) {
            echo $this->_border;
            foreach ($columns as $name => $length) {
                if (isset($row[$name])){
                    self::_printCell($length, $row[$name]);
                } else {
                    self::_printCell($length);
                }
            }
            echo "\n";
        }
        $this->_printLine(false);
    }

    private function _getColumnLength($column, $data)
    {
        $max = strlen($column);
        foreach ($data as $row) {
            $length = (isset($row[$column]) ? strlen($row[$column]) : 0);           
            if ($length > $max) {
                $max = $length;
            }
        }
        return $max;
    }

    private function _printCell($length, $string = null)
    {
        echo str_repeat(' ', $length - strlen($string));
        echo $string;
        echo $this->_border;
    }
}