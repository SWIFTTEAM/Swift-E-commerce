<?php

if(isset($_POST['account']) && isset($_POST['password'])){
	include("mysqlConnect.php");
	
	$account = $_POST['account'];
	$pw = $_POST['password'];
	
	$selectS = "SELECT `CustomerID` 
				FROM `Customers` 
				WHERE `Account` = '$account' AND `Password` = '$pw'";
	$selectQ = mysql_query($selectS) or die(mysql_error());
	
	$results = array();
	
	if(mysql_num_rows($selectQ) == 1){
		$results[] = Array("errorStatus" => "1");
		while($r = mysql_fetch_assoc($selectQ)){
			$results[0] += $r;
		}
	}else{
		$results[] = Array("errorStatus" => "2");
	}
	
}else{
	$results[] = Array("errorStatus" => "3");
	
} 

echo json_encode($results);

?>