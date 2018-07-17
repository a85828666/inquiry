{* admin_index.tpl *}
<h1>管理画面 ログイン</h1>
{if true == $error}
<span style="color: #f00">
    ログインでエラーがありました。<br>
</span>
{/if}

<form  method="post"  action="./admin_login.php">
ID: <input  name="id"><br>
password:<input  type="password"  name="pw"><br>
<br>
<button>ログイン</button>
</form>

