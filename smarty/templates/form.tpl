{*  form.tpl  *}
<h1>お問い合わせフォーム</h1>
{if true == $error.address_empty}
    連絡先は必須入力です。<br>
{/if}
{if true == $error.body_empty}
    問い合わせ内容は必須入力です。<br>
{/if}
{if true == $error.csrf_error}
    画面遷移に不正があります(CSRF)。<br>
{/if}

<form action="./input.php" method="post">
<input type="hidden" name="csrf" value="{$csrf_token}">

お名前:<input name="name" value="{$input_data.name}"><br>
連絡先(email):<input name="address"
    value="{$input_data.address}"><br>
問い合わせ内容
<textarea name="body">{$input_data.body}</textarea><br>
<button type="submit">問い合わせる</button>
</form>

