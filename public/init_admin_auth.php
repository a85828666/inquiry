<?php  // init_admin_auth.php
//
require_once('init.php');

// 認可処理
if (false === isset($_SESSION['admin_auth'])) {
    // ログイン情報がないのでindexにすっ飛ばす
    header('Location: ./admin_index.php');
    exit;
}

