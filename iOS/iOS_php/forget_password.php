<?php

if(isset($_POST['account']) && isset($_POST['email']) && isset(id)){
	include("Git_Swift/Swift-E-commerce/iOS/iOS_php/mysqlConnect.php");
	
	$account = $_POST['account'];
	$email = $_POST['email'];
	$id = $_POST['id'];
	
	$selectS = "SELECT * FROM `Customers` WHERE `CustomerAccount` = '$account' AND `CustomerEmail` = '$email' AND `CustomerIdentify` = '$id' ";
	$selectQ = mysql_query($selectS) or die(mysql_error());
	
	$results = array();
	
	if(mysql_num_rows($selectQ) == 1){
		$results[] = Array("errorStatus" => "1");
	}else{
		$results[] = Array("errorStatus" => "2");
	}
	
}else{
	$results[] = Array("errorStatus" => "3");
} 

echo json_encode($results);

?>