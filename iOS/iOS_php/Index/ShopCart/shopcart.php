<?php

if(isset($_POST['id'])){
	require '../../mysqlConnect.php';
	
	$id = $_POST['id'];
	
	$selectS = "SELECT C.Account , C.NameChi , A.CustomerID as 'PC_ID' ,A.Name,A.Price,A.PictureName,B.CartID,B.Size,B.Color,B.quantity,B.CustomerID as 'UC_ID' FROM Products as A, ShopCart as B, Customers C WHERE A.ProductID=B.ProductID AND A.CustomerID=C.CustomerID AND B.CustomerID='$id' ORDER BY A.CustomerID ASC";
	$selectQ = mysql_query($selectS) or die(mysql_error());
	
	$results = array();
	
	if(mysql_num_rows($selectQ) > 0){
		//$results[] = Array("Status" => "1");
		while($r = mysql_fetch_assoc($selectQ)){
			$results[] = $r;
		}
		echo json_encode($results);
	}
	
}

?>