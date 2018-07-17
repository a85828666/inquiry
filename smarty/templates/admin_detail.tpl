<html>
{*  admin_detail.tpl  *}
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
</head>
<body>
  <div class="container">
  <h1>問い合わせ詳細</h1>
  {* $detail|var_dump *}
  <a href="./admin_list.php">一覧に戻る</a>

    <table class="table table-hover">
    <tr>
       <th>ID
       <td>{$detail.id}
    <tr>
       <th>名前
       <td>{$detail.name}
    <tr>
       <th>アドレス
       <td>{$detail.address}
    <tr>
       <th>問い合わせ本文
       <td><pre>{$detail.body}</pre>
    <tr>
       <th>問い合わせ日
       <td>{$detail.created_at}
    <tr>
       <th>返信者
       <td>{$detail.response_name}
    <tr>
       <th>返信内容
       <td><pre>{$detail.response_body}</pre>
    <tr>
       <th>返信日
       <td>{$detail.response_at}
    </table>

    <h2>問い合わせ返信登録</h2>
    <form action="./admin_update.php" method="post">
        <input type="hidden" name="csrf" value="{$csrf_token}">
        <input type="hidden" name="id" value="{$detail.id}">
        返信内容<br><textarea name="response_body"></textarea><br>
        <button>返信内容登録</button>
    </form>

  </div>
</body>
</html>

