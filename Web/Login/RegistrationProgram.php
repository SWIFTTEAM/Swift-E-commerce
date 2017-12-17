<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>無標題文件</title>
</head>

<body>
<img src="Banner1.jpg" width="1500" height="130" /><br />
<?php
session_start();
/*
	$mysqli = new mysqli('localhost', 'root', '', '');

    $mysqli->query("SET NAMES utf8");
	
	if($mysqli->connect_error){
   die("Connect failed:".$conn->connect_error);
}
	*/

 
//error_reporting(7) ;
$Link = mysql_connect('localhost', 'root', ''); 
mysql_select_db("e-commerce"); //link database
mysql_query("SET NAMES utf8"); //set language

 // include("mysqlConnect.php");

  $_SESSION["account"] = $_POST['account'];
  $_SESSION["password"] = $_POST['password'];
  $_SESSION["name"] = $_POST['name'];
  $_SESSION["email"] = $_POST['email'];
  $_SESSION["identify"] = $_POST['identify'];
  $_SESSION["birth"] = $_POST['birth'];
  $_SESSION["phone"] = $_POST['phone'];
  $_SESSION["ResidenceAddress"] = $_POST['ResidenceAddress'];
  $_SESSION["MailingAddress"] = $_POST['MailingAddress'];
  $_SESSION["sex"] = $_POST['sex'];
  	   
  $account = $_SESSION["account"];
  $password = $_SESSION["password"];
  $name = $_SESSION["name"];
  $email = $_SESSION["email"];
  $identify = $_SESSION["identify"];
  $birth = $_SESSION["birth"];
  $phone = $_SESSION["phone"];
  $ResidenceAddress = $_SESSION["ResidenceAddress"];
  $MailingAddress = $_SESSION["MailingAddress"];
  $sex = $_SESSION["sex"];
  
  $sql = "Select * FROM `customers`";
  $result = mysql_query($sql) ;
  $row = @mysql_fetch_row($result);
  
  if ($_SESSION["account"] != null && $_SESSION["password"] != null)
      {
  
        $sql = "INSERT INTO `customers` (CustomerAccount, CustomerPassword, CustomerName, CustomerEmail, CustomerIdentify, CustomerBirth, CustomerPhone, CustomerResidenceAddress, CustomerMailingAddress, CustomerSex) VALUES('$account', '$password', '$name', '$email', '$identify', '$birth', '$phone', '$ResidenceAddress', '$MailingAddress', '$sex')";
		
		
		        if(mysql_query($sql))
        {
                echo '<br><div align="center">新增成功!<div>';
          //      echo '<meta http-equiv=REFRESH CONTENT=2;url=index.php>';
        }
        else
        {
                echo '<br><div align="center">新增失敗!<div>';
           //     echo '<meta http-equiv=REFRESH CONTENT=2;url=index.php>';
        }
	
      }
    else
      {
        echo '<br><div align="center">您無權限觀看此頁面!<div>';
      }

  if ($_SESSION["account"]==$row[1] && $_SESSION["password"]==$row[2])
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

	}
?>
  <div align="center"><a href="Registration.php"><BR>返回登入頁</a></p><div>
</body>
</html>