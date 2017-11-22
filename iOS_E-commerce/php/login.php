<?php

if(isset($_POST['account']) && isset($_POST['password'])){
	include("mysqlConnect.php");
	
	$account = $_POST['account'];
	$pw = $_POST['password'];
	
	$selectS = "SELECT * FROM `ClientData` WHERE `Cli_Account` = '$account' AND `Cli_PW` = '$pw'";
	$selectQ = mysql_query($selectS) or die(mysql_error());
	
	if(mysql_num_rows($selectQ) == 1){
		$results = Array("errorStatus" => "1");
	}else{
		$results = Array("errorStatus" => "2");
	}
	
}else{
	$results = Array("errorStatus" => "3");
} 

echo json_encode($results);

?>