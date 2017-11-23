
<?php session_start(); ?>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>

<?php
include("mysql_connect.inc.php"); 
//檢查使用者是否登錄
function checklogin(){
if(emptyempty($_SESSION['user_info'])){ //檢查一下session是不是為空
if(emptyempty($_COOKIE['username']) || emptyempty($_COOKIE['password'])){ //如果session為空，並且使用者沒有選擇記錄登錄狀
header("location:checkpassword.php?req_url=".$_SERVER['REQUEST_URI']);
}else{ //使用者選擇了記住登錄狀態
setcookie("username", $username, time()+3600*24*365);
setcookie("password", $password, time()+3600*24*365);
$user = getUserInfo($_COOKIE['username'],$_COOKIE['password']); //去取使用者的個人資料

if(emptyempty($user)){ //使用者名密碼不對沒到取到資訊，轉到登錄頁面	

header("location:checkpassword.php?req_url=".$_SERVER['REQUEST_URI']);
}else{
$_SESSION['user_info'] = $user; //使用者名和密碼對了，把使用者的個人資料放到session裡面
}
}
}
}
?>
</body>
</html>