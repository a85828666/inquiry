<?php  // fin.php

// 出力
error_reporting(E_ALL & ~E_NOTICE);
$smarty_obj->display($tmp_filename);
