<?php  // scope_2.php

function hoge() {
    $v_hoge = 100;
}
function foo() {
    var_dump($v_hoge); // 使えないのでnull
}

hoge();
foo();

