<?php  // scope_5.php
//
function hoge() {
    static $i = 0; // 変数寿命がしぶとくなって、生き残る
    $i ++;
    var_dump($i);
}

//
hoge();
hoge();
hoge();


