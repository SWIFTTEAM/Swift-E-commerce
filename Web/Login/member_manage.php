<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<?php session_start() ?> 
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
  border-width: 1px;
  border-style:solid;
  border-radius:10px;
  border-color:#CCC;
  font-family:"微軟正黑體";
}
#title {
  position:relative;
  top: 80px;
  font-family:"微軟正黑體";
  font-size:24px;
}
a {
	text-decoration:none;
}

</style>
<div id="ontopDiv" >
  Peng.
</div>
 <hr color="#5CA8B6" size="1px"/>
 
 <div id="title" align="center">
 會員管理
 </div>
 
 <div id="article">
 <?php
    include('connect_db.php');
 ?>
  <form method="post" action="member_manage.php">
 
    查詢：
    <input name="mail" type="email"/>
    <input type ="submit" name="send" value="送出"/>
  </form>
  <center>
<?php
   error_reporting(0);
   $_SESSION['mail'] = $_POST['mail'];
   $mail = $_SESSION['mail'];
   
   $select_mail = "SELECT * FROM customers "; //查詢
   
   $data = mysql_query($select_mail); //連接
   
   //$rs = mysql_fetch_row($data);
  
   $num = mysql_num_rows($data); //資料比數
   //echo $num;
   $title = array('會員編號','帳號','密碼','中文姓名','英文姓名','Email',
   			      '身分證','生日','手機號碼','備用手機號碼','家裡電話','戶籍地址',
				  '通訊地址','常用地址','註冊日期時間','註冊時間','性別','國籍',
				  '公司代號');
  
  for($i=1;$i<=$num;$i++) //有幾筆就查幾次
  {  
     $rs=mysql_fetch_row($data);
     if($mail == $rs[5]){
	  for($j=0;$j<=18;$j++){
	  ?>
       
      <table border="1" width="500" align="center">
	  <tr> 
      <td width="100"><?php echo $title[$j];?></td>     
	  <td><?php echo $rs[$j];?></td>
	  </tr>
	  </table>
	  
     <?php
	  }
	 }
 }
?> 
 </center>  
 </div>
 
   
</body>
</html>