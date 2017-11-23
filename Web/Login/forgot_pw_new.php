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
    include("connect_db.php");
 ?> 
 <div style="font-size:large; font-family:Microsoft JhengHei; 
             background-color:#AAAAAA;">忘記密碼
 </div> 
 <?php
   //error_reporting();
  /* ini_set('display_errors',true);
   ini_set('error_reporting', E_ALL);
   echo ini_set('SMTP','xxx.xxx.xxx.xxx');
   echo ini_get('SMTP');
   phpinfo();*/
   
   $account=$_SESSION['account'];
   $mail = $_SESSION['mail'];
   $identity = $_SESSION['identity'];
   
   $select_cID = "SELECT * FROM customers"; //查詢

   $data = mysql_query($select_cID); //連接

   //$rs = mysql_fetch_row($data);
  
   $num = mysql_num_rows($data); //資料比數
   //echo $num;

  for($i=1;$i<=$num;$i++) //有幾筆就查幾次
  {  
     $rs=mysql_fetch_row($data);
     if($account == $rs[1] && $mail == $rs[4] && $identity == $rs[5]){
      echo $rs[0];
      echo $rs[1];
	  echo $rs[2];
	  echo $rs[3];
	  echo $rs[4];
	  echo $rs[5];
	 }
 }
  
  $random=10;
  $randoma="";

  for($i=1;$i<=$random;$i=$i+1){
      //大寫、小寫、數字，隨機產生
      $c=rand(1,3);
      
	  //小寫97-122,十進制,ASCII轉字符
	  if($c==1){
		 $a=rand(97,122);$b=chr($a);
	    } 
	  //大寫,十進制
	  if($c==2){
		 $a=rand(65,90);$b=chr($a);
		}  
		 
	  //亂數0-9
	  if($c==3){
		 $b=rand(0,9);
		}
 	   $randoma=$randoma.$b;
      }
	 
	  echo "亂數".$randoma;
	 
	 
	 //$subject = '新密碼';
	 //$message = $randoma;
	 //$headers = 'From: PHP';
	 //mail($to,$subject,$message,$headers);
	 
 ?>
  
  </center>
</body>
</html>