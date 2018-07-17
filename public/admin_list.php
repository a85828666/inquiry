<?php  // admin_list.php
//
require_once('init_admin_auth.php');

//var_dump($_GET);

// DBへの接続
$dbh = db_connect($config);

/*
 * 検索条件の確認
 */
$where = [];
$where_data = [];
$find_uri_params = [];
// 「名前」の検索
$find_name = (string)@$_GET['find_name'];
//var_dump($find_name);
if ('' !== $find_name) {
    // SQLのWHERE句作成用
    $where[] = 'name LIKE :find_name';
    $where_data[':find_name'] = "%{$find_name}%";
    // URIのパラメタ作成用
    $find_uri_params['find_name'] = $find_name;
    // テンプレートへのアサイン
    $smarty_obj->assign('find_name', $find_name);
}

/*
 * sort
 */
// sort用ホワイトリスト
$sort_list = [
    'id'         => 'id',
    'id_d'       => 'id DESC',
    'name'       => 'name',
    'name_d'     => 'name DESC',
    'created'    => 'created_at',
    'created_d'  => 'created_at DESC',
    'response'   => 'response_at',
    'response_d' => 'response_at DESC',
];
// ソート内容の把握
$sort_wk = (string)@$_GET['sort'];
$smarty_obj->assign('sort', $sort_wk);
if (isset($sort_list[$sort_wk])) {
    $sort = $sort_list[$sort_wk];
} else {
    $sort = 'created_at DESC';
}

// 検索条件の保存
$smarty_obj->assign('find_query', http_build_query($find_uri_params));

// プリペアドステートメントの作成
$sql = 'SELECT * FROM inquiry';
if ([] !== $where) {
    $sql .= ' WHERE ' . implode(' AND ', $where);
}
$sql .= ' ORDER BY ' . $sort .' LIMIT 0, 20;';
$pre = $dbh->prepare($sql);

// 値をバインド
foreach($where_data  as  $k => $v) {
    $pre->bindValue($k, $v); // XXX 全部stringなので第三引数は色々省略
}

// SQLの実行
$r = $pre->execute();

//データを取得
$data = $pre->fetchAll();
$smarty_obj->assign('data', $data);

// 出力
$tmp_filename = 'admin_list.tpl';
require_once('./fin.php');

