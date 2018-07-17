<html>
{*  admin_list.tpl  *}
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
</head>

<body>

<div class="container">
<h1>問い合わせ一覧</h1>
{* $data|var_dump *}

<h2>検索</h2>
<form action="admin_list.php" method="get">
<input type="hidden" name="sort" value="{$sort}">
<label><input name="find_no_response" type="checkbox">「返信していない」もの</label><br>
名前：<input name="find_name" value="{$find_name}" ><br>
連絡先：<input name="find_address" ><br>
作成日：<input name="find_created_from" >～<input name="find_created_to" ><br>
<br>
<button>検索する</button>
</form>

<form action="admin_list.php" method="get">
<button>sort/検索条件のリセット</button>
</form>

<h2>一覧</h2>
<table class="table table-hover">
<tr>
  <th>ID<a href="./admin_list.php?sort=id_d&{$find_query}">▼</a>
        <a href="./admin_list.php?sort=id&{$find_query}">▲</a>
  <th>名前<a href="./admin_list.php?sort=name_d&{$find_query}">▼</a>
          <a href="./admin_list.php?sort=name&{$find_query}">▲</a>
  <th>作成日<a href="./admin_list.php?sort=created_d&{$find_query}">▼</a>
            <a href="./admin_list.php?sort=created&{$find_query}">▲</a>
  <th>返信日<a href="./admin_list.php?sort=response_d&{$find_query}">▼</a>
            <a href="./admin_list.php?sort=response&{$find_query}">▲</a>
{foreach from=$data item=i}
<tr>
  <td><a href="./admin_detail.php?id={$i.id}">{$i.id}</a>
  <td>{$i.name}
  <td>{$i.created_at}
  <td>{$i.response_at}
  <td><a href="./admin_detail.php?id={$i.id}">詳細閲覧</a>
{/foreach}

</table>
</div>

</body>
</html>






