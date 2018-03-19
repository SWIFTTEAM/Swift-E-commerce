<?php

if(isset($_POST['PD_id'])){
	include("../mysqlConnect.php");
	
	$PD_id = $_POST['PD_id'];
	
	$selectS = "SELECT * 
				FROM `Products` 
				WHERE `ProductID` = '$PD_id'";
	$selectQ = mysql_query($selectS) or die(mysql_error());
	
	$results = array();
	
	if(mysql_num_rows($selectQ) == 1){
		while($r = mysql_fetch_assoc($selectQ)){
			$results[] = $r;
		}
		echo json_encode($results);
	}
}

?>