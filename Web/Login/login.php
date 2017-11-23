<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>無標題文件</title>
</head>
<body>
<form  action="log.php" method="post">
  <center><h1>登入</h1></center>
  
  <table width="246" border="1" align="center" background="1.jpg">
    <tr>
    <td width="56">帳號：</td>
    <td width="174"><input type="text" name="user" value=""/>
      <br /></td>
  </tr>
  <tr>
    <td>密碼：</td>
    <td><input type="text" name="pw" value=""/></td>
  </tr>
  <tr>
    <td colspan="2"><input type="submit" name="ss" value="確定"/></td>
    </tr>
</table>
  <br>
</form>
<body>
<?php
session_start();
//unset($_SESSION['user']);
error_reporting(7) ;
$Link = mysql_connect('localhost', 'root', ''); 
mysql_select_db("E-commerce"); //link database
mysql_query("SET NAMES utf8"); //set language
		
//----------------------------------------------------------------
		
if ( $_POST["ss"] == "確定"){
  if (! $_POST['user'] || ! $_POST['pw'])
      {
	    echo "請輸入帳號或密碼";
  	  }
   else{
	   
	    $account=$_POST['account'];
		$password=$_POST['password'];		 
		$_SESSION["account"]=$account;	
		
		
	    $sql = "SELECT * FROM `E-commerce` WHERE `account` LIKE '$account'";//查詢整個表單
        $result = mysql_query($sql) ;
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
		
	
         	 header("Refresh:5; url=0816h.logout.php");     
         	 die ("<br><br><br>5秒後登出。");

 	     if ($account==$row[1] && $password == $row[2])
			 {		
 	  	       echo "帳號或密碼輸入錯誤";}	
			    }
  
	}   	 
}

?>
</body>
</html>