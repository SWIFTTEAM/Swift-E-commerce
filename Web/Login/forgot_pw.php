<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php session_start() ?> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>無標題文件</title>
</head>

<body>
<style>
#ontopDiv {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 60px;
    z-index: 10000;
    background-color: #4ebeba;
    
    padding: 15px;
    font-size: 48px;
	font-family:"微軟正黑體";
	color:#FFF;
}
#login {
  position: absolute;
  top: 60px;
  right: 10px;
  width: 150px;
  height: 50px;
  text-align:center;
  font-size:14px;
  font-family:"微軟正黑體";
}
#article {
  position:relative;
  top: 100px;
  left:280px;
  width:60%;
  border-width: 1px;
  border-style:solid;
  border-radius:10px;
  border-color:#CCC;
  font-family:"微軟正黑體";
}
#category {
  position: absolute;
  top:100px;
  left: 0px;
  background-color:	#F8F8FF;
  width: 150px;
  height: 300px;
  border-width: 1px;
  border-style:solid;
  border-radius:10px;
  border-color:#F0F8FF;
  text-align:center;
  font-family:"微軟正黑體";
}
#top10 {
  position: absolute;
  top:100px;
  right: 0px;
  background-color:	#F8F8FF;
  width: 150px;
  height: 300px;
  border-width: 1px;
  border-style:solid;
  border-radius:10px;
  border-color:#F0F8FF;
  text-align:center;
  font-family:"微軟正黑體";
}
a {
	text-decoration:none;
}

</style>
<div id="ontopDiv" >
  Peng.
  <div id="login">
  <a href="111" style="color:#FFF">註冊</a>  |  
  <a href="111" style="color:#FFF">登入</a>
  </div>
</div>
<div id="category">
 商品分類
 <hr color="#5CA8B6" size="1px"/>
 <a href="111" style="color:#000">男裝</a>
</div>
<div id="article">
 <?php
    include('connect_db.php');
 ?>

 <center>
 忘記密碼
 
 <p>
 <font size="-1">若您忘記密碼，請填寫以下資料，將於資料比對無誤後，將臨時密碼發送至您註冊的電子郵件信箱</font>
 <p>
 
 <form method="post" action="forgot_pw.php">
 
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
  </center>
  </p>
  <?php
   error_reporting(0);
   $_SESSION['account']=$_POST['account'];
   $_SESSION['mail']=$_POST['mail'];
   $_SESSION['identity']=$_POST['identity'];
   ?>
   
   <?php
   if($_SESSION['account'] != NULL && $_SESSION['mail'] != NULL &&  
      $_SESSION['identity'] != NULL){
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
   </div>
 <div id="top10">
 熱搜商品TOP10
 <hr color="#5CA8B6" size="1px"/>
 <a href="111" style="color:#000">男裝</a>
</div>  
   
</body>
</html>