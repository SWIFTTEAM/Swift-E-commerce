<?php
	
if(! mysql_connect ("127.0.0.1","root","")) //與Mysql資料庫連接
   {
	 die ("資料連結失敗！");	 
   }
	   
if(! mysql_select_db("SwiftProject")) //用來搜尋Mysql資料庫
   {
	  die ("資料庫選擇失敗！") ; 
   }
mysql_query("SET NAMES 'UTF8'"); //設定編碼語系
	
?>
