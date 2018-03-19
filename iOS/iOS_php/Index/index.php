<?php
include("../mysqlConnect.php");	

$query = 
"SELECT A.ProductID , A.Name , A.Price , A.PictureName , B.Account 
FROM Products as A , Customers as B
WHERE A.CustomerID = B.CustomerID
ORDER BY A.ProductID DESC";
$resultset = mysql_query($query) or die(mysql_error());;
	
$records = array();
while($r = mysql_fetch_assoc($resultset)){
	$records[] = $r;
}

echo json_encode($records);	
?>