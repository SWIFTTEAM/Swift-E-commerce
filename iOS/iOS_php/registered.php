<?php 

    
if(isset($_POST['account']) && isset($_POST['password'])){
	include("mysqlConnect.php");
	
	$Account = $_POST['account'];
	$Password = $_POST['password'];
	$NameChi = $_POST['namechi'];
	$NameEng = $_POST['nameeng'];
	$Email=$_POST['email'];
	$Identify=$_POST['identity'];
	$Birth=$_POST['birth'];
	$CellPhone=$_POST['cellphone'];
	$CellPhone_spare=$_POST['cellphone_spare'];
	$HomePhone=$_POST['homephone'];
	$ResidenceAddress=$_POST['residenaddress'];
	$MailingAddress=$_POST['mailingaddress'];
	$DeliveryAddress=$_POST['deliveryaddress'];
	$Sex=$_POST['sex'];
	$CountryID=$_POST['countryid'];
	$CompanyID=$_POST['companyid'];
    
    $time = strtotime($Birth);
    
    $newformat = date('Y-m-d',$time);

    
	date_default_timezone_set('Asia/Taipei');
    $datetime= date("Y/m/d H:i:s");
    $RegisteredTime=$datetime;
    //$RegisteredTimeStamp=UNIX_TIMESTAMP($datetime);
    
	$sql_insert="INSERT INTO `customers`( `Account`, `Password`, `NameChi`, `NameEng`, `Email`, `Identify`, `Birth`, `CellPhone`, `CellPhone_Spare`, `HomePhone`, `ResidenceAddress`, `MailingAddress`, `DeliveryAddress`, `RegisteredTime`, `RegisteredTimeStamp`, `Sex`, `CountryID`, `CompanyID`)
  VALUES  ('".$Account."','".$Password."','".$NameChi."','".$NameEng."','".$Email."','".$Identify."',
  '".$newformat."','".$CellPhone."','".$CellPhone_spare."','".$HomePhone."','".$ResidenceAddress."'
 ,'".$MailingAddress."','".$DeliveryAddress."','".$RegisteredTime."','".$RegisteredTimeStamp."','".$Sex."','".$CountryID."','".$CompanyID."')";;


	
	$sql_selctA = "SELECT * FROM `Customers` WHERE `Account` = '$Account' ";
	$sql_selctE = "SELECT * FROM `Customers` WHERE `Email` = '$Email' ";
	
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

?>
