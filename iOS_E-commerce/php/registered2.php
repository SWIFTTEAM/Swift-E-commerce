<?php 

    
if(isset($_POST['account']) && isset($_POST['password'])){
	include("mysqlConnect.php");
	
	$account = $_POST['account'];
	$pw = $_POST['password'];
	$name = $_POST['name'];
	$mail=$_POST['mail'];
	$identity=$_POST['identity'];
	$birth=$_POST['birth'];
	$phone=$_POST['phone'];
	$residenaddress=$_POST['residenaddress'];
	$mailingaddress=$_POST['mailingaddress'];
	$sex=$_POST['sex'];
	$country=$_POST['country'];
	$company=$_POST['company'];
	$pic=$_POST['pic'];
	
	
	$sql_insert="INSERT INTO `customers`(`CustomerAccount`,`CustomerPassword`, 
 `CustomerName`, `CustomerEmail`, `CustomerIdentify`,`CustomerBirth`,
 `CustomerPhone`, `CustomerResidenceAddress`,`CustomerMailingAddress`,
 `CustomerSex`, `CountryID`, `CompanyID`)
  VALUES  ('".$account."','".$pw."','".$name."','".$mail."','".$identity."','".$birth."',
  '".$phone."','".$residenaddress."','".$mailingaddress."','".$sex."','".$country."'
 ,'".$company."')";;
	$sql_selctA = "SELECT * FROM `Customers` WHERE `CustomerAccount` = '$account' ";
	$sql_selctE = "SELECT * FROM `Customers` WHERE `CustomerEmail` = '$mail' ";
	
	$selectQ1 = mysql_query($sql_selctA) or die(mysql_error());
	$selectQ2 = mysql_query($sql_selctE) or die(mysql_error());
	
	if(mysql_num_rows($selectQ1) == 0){
		//mysql_query($sql_insert);
		//帳號OK
		$results = Array("errorStatus" => "1");
		if(mysql_num_rows($selectQ2) == 0){
			mysql_query($sql_insert);
			//mailOK
			$results = Array("errorStatus" => "4");
		}else{
			//mail依樣
			$results = Array("errorStatus" => "5");
		}
		
	}else{
		//帳號依樣
		$results = Array("errorStatus" => "2");
	}
	
}else{
	//沒進資料庫
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
