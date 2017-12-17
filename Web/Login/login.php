<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>無標題文件</title>
</head>
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript" ></script>
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<style type="text/css">

body {
	background-color: #4ebeba;
}
#menu {
	background-color: #FF9;
}
#content {
	background-color: #0FF;
}
#foot {
	alignment-adjust:middle;
	background-color: #F96;
	position: absolute;
	bottom: 0px;
	width: 1300px;

}
#header{
	height:100px;
}
</style>
</head>


<div  align="center" >
<img src="1.jpg" width="1500" height="200" align="center" />
</div>

<div id="text">
<form  action="login.php" method="post"  >
<center><h1>登入</h1></center>
<table width="246" border="1" align="center" ">
    <tr>
    <td width="56">帳號：</td>
    <td width="174"><input type="text" name="account" value=""/>
      <br /></td>
  </tr>
  <tr>
    <td>密碼：</td>
    <td><input type="password" name="password" value=""/></td>
  </tr>
  <tr>
    <td colspan="2"><input type="submit" name="ss" value="確定"/></td>
  </tr>
</table>

</div>
<div id="foot" align="center">
  <a href="secret.php">隱私權</a>
  <p>著作權所有 連絡電話：0912345678</p>
  <p>網頁更新日期：2017/12/17</p>
</div>

<body>
<?php
session_start();
error_reporting(7) ;
$Link = mysql_connect('localhost', 'root', ''); 
mysql_select_db("e-commerce"); //link database
mysql_query("SET NAMES utf8"); //set language	
//----------------------------------------------------------------
if (isset($_POST["ss"])) {

  if (! $_POST['account'] || ! $_POST['password'])
      {
	    echo "請輸入帳號或密碼";
  	  }
   else{
	   
	    $account=$_POST['account'];
		$password=$_POST['password'];		 
		$_SESSION["account"]=$account;	
		$sql = "SELECT * FROM `customers` WHERE `CustomerAccount` LIKE '$account'";
		$result = mysql_query($sql) or die("Error: " );
        $row = @mysql_fetch_array($result);//印出資料
		


	       if ($account==$row[1] && $password == $row[2])
		   
			{
			
			 echo "帳號：$row[1]<BR>";
      		 echo "密碼：$row[2]<BR>";
    		 echo "姓名：$row[3]<BR>";
      		 echo "信箱：$row[4]<BR>";
      		 echo "身分證字號：$row[5]<BR>";
      		 echo "生日：$row[6]<BR>";
      		 echo "電話：$row[7]<BR>";	
	  		 echo "居住地址：$row[8]<BR>";
      		 echo "郵寄地址：$row[9]<BR>";
      		 echo "性別：$row[10]<BR>";  
		
	
         	 header("Refresh:5; url=secret.php");     
         	 die ("<br><br><br>5秒後登出。");
}

 	     else{		
 	  	       echo "帳號或密碼輸入錯誤";}	
			    
  
	}   	 
}

?>

</body>
</html>