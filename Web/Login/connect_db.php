<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>無標題文件</title>
</head>

<body>
<?php
$Link = mysql_connect('localhost','root','');//連接伺服器
mysql_select_db('e-commerce');//資料庫名稱
mysql_query('set names utf8'); //語系utf8




/*if (!$Link) {
　die(' 連線失敗，輸出錯誤訊息 : ' . mysql_error());
}
echo ' 連線成功 '*/

//mysql_close($Link);
?>
</body>
</html>