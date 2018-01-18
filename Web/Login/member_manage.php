<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<?php session_start() ?> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>會員管理</title>
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
  width:80%;
  left:150px;
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
th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #4CAF50;
    color: white;
}


</style>
<div id="ontopDiv" >
  Peng.
</div>
 <hr color="#5CA8B6" size="1px"/>
 
 <div id="title" align="center">
 會員管理
 </div>
 
 <div id="article" >
 <?php
    include('connect_db.php');
 ?>
  <form method="post" action="member_manage_result.php">
 
    查詢：
    <input name="mail" type="email"/>
    <input type ="submit" name="send" value="送出"/><p>
  </form>
  <center>
 <?php 
    //預設每頁筆數
	$pageRow_records = 3;

	//預設頁數
   $num_pages = 1;

   //若已經有翻頁，將頁數更新
   if (isset($_GET['page'])) {
     $num_pages = $_GET['page'];
   }
   //本頁開始記錄筆數 = (頁數-1)*每頁記錄筆數
   $startRow_records = ($num_pages -1) * $pageRow_records;

   echo $startRow_records;

   //未加限制顯示筆數的SQL敘述句
   $query_RecNews = "SELECT * FROM `customers`";

   //加上限制顯示筆數的SQL敘述句，由本頁開始記錄筆數開始，每頁顯示預設筆數
   $query_limit_RecNews = $query_RecNews." LIMIT ".$startRow_records.", ".$pageRow_records;

   //以加上限制顯示筆數的SQL敘述句查詢資料到 $RecBoard 中
   $RecNews = mysql_query($query_limit_RecNews);

   //以未加上限制顯示筆數的SQL敘述句查詢資料到 $all_RecBoard 中
   $all_RecNews = mysql_query($query_RecNews);

   //計算總筆數
   $total_records = mysql_num_rows($all_RecNews);


   //計算總頁數=(總筆數/每頁筆數)後無條件進位。
   $total_pages = ceil($total_records/$pageRow_records);


   error_reporting(0);
   
   $select_mail = "SELECT * FROM customers "; //查詢
   
   $data = mysql_query($select_mail); //連接
   
   //$rs = mysql_fetch_row($data);
  
   $num = mysql_num_rows($data); //資料比數
   //echo $num;
   $title = array('會員編號','帳號','密碼','中文姓名','英文姓名','Email',
   			      '身分證','生日','手機號碼');
  ?>
  <table width="1000">
  
		<tr>
        <?php for($j=0;$j<=9;$j++){ ?>	
        <th>
        <?php echo $title[$j];}?>
        </th>
        </tr>
      
  <?php    
  /*for($i=1;$i<=$num;$i++) //有幾筆就查幾次
  {  
     $rs=mysql_fetch_row($data);
	 echo $rs;
     ?> 
      <tr>
      <?php for($j=0;$j<=8;$j++){?>
      <td>
      <?php echo $rs[$j]; }?>
      </td>
      </tr>
	  <?php }*/ ?>
  <?php
  /* while($rs=mysql_fetch_array($data)){
	   $id = $rs['CustomerID'];
	   $name = $rs['Account'];
	   //echo $id.','.$name;
  
   }*/
   $data2 = mysql_query($query_limit_RecNews);
   while($rs=mysql_fetch_array($data2)){
	   $id = $rs['CustomerID'];
	   $name = $rs['Account'];
	   echo $id.','.$name.','.$rs[2];
	   ?>
	   <tr>
	   <?php 
	   for($a=0;$a<=8;$a++){?>
	   <td>
       <?php echo $rs[$a];
	   }?>
       </td>
       </tr>
       <?php }?>
	   </table>
   
  
<?php

// 顯示的頁數範圍
$range = 10;
 
// 若果正在顯示第一頁，無需顯示「前一頁」連結
if ($num_pages > 1) {
	// 使用 << 連結回到第一頁
	echo " <a href={$_SERVER['PHP_SELF']}?page=1><<</a> ";
	// 前一頁的頁數
	$prevpage = $num_pages - 1;
	// 使用 < 連結回到前一頁
	echo " <a href={$_SERVER['PHP_SELF']}?page=".$prevpage.">上一頁</a> ";
} // end if
 
// 顯示當前分頁鄰近的分頁頁數
for ($x = (($num_pages - $range) - 1); $x < (($num_pages + $range) + 1); $x++) {
	// 如果這是一個正確的頁數...
	if (($x > 0) && ($x <= $total_pages)) {
		// 如果這一頁等於當前頁數...
		if ($x == $num_pages) {
			// 不使用連結, 但用高亮度顯示
			echo " [<b>".$x."</b>] ";
			// 如果這一頁不是當前頁數...
		} else {
			// 顯示連結
			echo " <a href=member_manage.php?page=".$x.">".$x."</a> ";
		} // end else
	} // end if
} // end for
 
// 如果不是最後一頁, 顯示跳往下一頁及最後一頁的連結
if ($num_pages != $total_pages) {
	// 下一頁的頁數
	$nextpage = $num_pages + 1;
	// 顯示跳往下一頁的連結
	echo " <a href={$_SERVER['PHP_SELF']}?page=".$nextpage.">下一頁</a> ";
	// 顯示跳往最後一頁的連結
	echo " <a href={$_SERVER['PHP_SELF']}?page=".$total_pages.">>></a> ";
} // end if
?>
 </center>  
 </div>
 
   
</body>
</html>