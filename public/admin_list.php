<?php  // admin_list.php
//
require_once('init_admin_auth.php');

// DBへの接続
$dbh = db_connect($config);

// sort用ホワイトリスト
$sort_list = [
    'id' => 'id',
    'id_d' => 'id DESC',
    // XXXXXX 追加あり
];
// ソート内容の把握
$sort_wk = (string)@$_GET['sort'];
if (isset($sort_list[$sort_wk])) {
    $sort = $sort_list[$sort_wk];
} else {
    $sort = 'created_at DESC';
}

// プリペアドステートメントの作成
$sql = 'SELECT * FROM inquiry ORDER BY ' . $sort .' LIMIT 0, 20;';
$pre = $dbh->prepare($sql);
// 値をバインド
// XXX 今回は(一旦)なし
// SQLの実行
$r = $pre->execute();

//データを取得
$data = $pre->fetchAll();
$smarty_obj->assign('data', $data);

// 出力
$tmp_filename = 'admin_list.tpl';
require_once('./fin.php');






