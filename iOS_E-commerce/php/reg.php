<?php 

if(isset($_POST['account']) && isset($_POST['password'])){
	include("mysqlConnect.php");
	
	$account = $_POST['account'];
	$pw = $_POST['password'];
	
	$sql="INSERT INTO `customers`(`CustomerAccount`, `CustomerPassword`) VALUES ('$account','$pw')";
	$selectS = "SELECT * FROM `Customers` WHERE `CustomerAccount` = '$account' AND `CustomerPassword` = '$pw'";
	$selectQ = mysql_query($sql) or die(mysql_error());
	
	if(mysql_num_rows($selectQ) == 1){
		$results = Array("errorStatus" => "1");
	}else{
		$results = Array("errorStatus" => "2");
	}
	
}else{
	$results = Array("errorStatus" => "3");
} 

echo json_encode($results);

/*

if($username==null)
{
    echo"ERROE！username is null!";
}
elseif($password==null)
{
	echo"ERROE！password is null!";
}
else
{
$sql="INSERT INTO `customers`(`CustomerID`, `CustomerAccount`, `CustomerPassword`, `CustomerName`, `CustomerEmail`, `CustomerIdentify`, `CustomerBirth`, `CustomerPhone`, `CustomerResidenceAddress`, `CustomerMailingAddress`, `CustomerSex`, `CountryID`, `CompanyID`, `StickyName`) VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value-8],[value-9],[value-10],[value-11],[value-12],[value-13],[value-14])";
if(mysql_query($sql))
{
     echo",join succese!";
}
else
{
     echo",join fail!";
}
}*/
?>