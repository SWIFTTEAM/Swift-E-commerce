<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php session_start() ?> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>無標題文件</title>
</head>

<body>
  <center>
 <?php
    include('connect_db.php');
 ?> 
 <div style="font-size:large; font-family:Microsoft JhengHei; 
             background-color:#AAAAAA;">忘記密碼
 </div> 

 <form method="post" action="forgot_pw.php">
  <p>
    帳號：
    <input name="account" type="text"/><p>
    信箱：
    <input name="mail" type="email"/><p>
    身分證：
    <input name="identity" type="text"/><p>
    <input type ="submit" name="send" value="送出臨時密碼"/>
    &nbsp; 
     <input type="button" name="cancel" value="取消"/>
  </form>
  <?php
   error_reporting(0);
   $_SESSION['account']=$_POST['account'];
   $_SESSION['mail']=$_POST['mail'];
   $_SESSION['identity']=$_POST['identity'];
   ?>
   
   <?php
   if($_SESSION['account'] != NULL && $_SESSION['mail'] != NULL && $_SESSION['identity'] != NULL){
	   if(!ctype_alnum($_SESSION['account']) ||
		  !ctype_alnum($_SESSION['identity'])){
		  }
	     echo "Y";
		 header("Location:forgot_pw_new.php");
	   }else{
		  echo "N"; 
		  ?> 
          <script type="text/javascript">
		  
		   window.alert("請輸入欄位");
		  
		  </script>
          
	   <?php 
	       
		  }
   
   
   ?>
   
   
  </center>
</body>
</html>