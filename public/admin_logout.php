<?php  // admin_logout.php

//
require_once('init.php');

// 認可情報を削除する
unset($_SESSION['admin_auth']);

//
header('Location: ./admin_index.php');
