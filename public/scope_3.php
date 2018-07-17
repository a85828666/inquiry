<?php  // scope_3.php

// local変数の寿命は儚い
function hoge($i) {
    var_dump($v_hoge); // 毎回nullになる
    $v_hoge = $i;
    var_dump($v_hoge); // 引数の値が出る
}

hoge(1);
hoge(2);
hoge(3);


