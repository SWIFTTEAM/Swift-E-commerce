<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>註冊 / Registered</title>
</head>

<body background="http://www.zlcool.com/d/file/2010/01/01/5177e9aa31b38aed2e059ef379ca9fda.jpg">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<form name="form" method="post" action="RegistrationProgram.php">
<img src="Banner1.jpg" width="1500" height="130" /><br />
<div align="center"><br />
    <table width="380" border="1">
      <tr>
    <td><font face="微軟正黑體">帳　　號</font></td>
    <td><input style="font-size:20px"  onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" type="text" name="account" /></td>
  </tr>
  <tr>
    <td><font face="微軟正黑體">密　　碼</font></td>
    <td><input style="font-size:20px" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" type="password" name="password" /></td>
  </tr>
  <tr>
    <td><font face="微軟正黑體">姓　　名</font></td>
    <td><input style="font-size:20px" type="text" name="name" /></td>
  </tr>
  <tr>
    <td><font face="微軟正黑體">信　　箱</font></td>
    <td><input style="font-size:20px" type="email" name="email" value = "abc@gmail.com" /></td>
  </tr>
  <tr>
    <td><font face="微軟正黑體">身份證字號</font></td>
    <td><input style="font-size:20px" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" type="text" name="identify" /> </td>
  </tr>
  <tr>
    <td><font face="微軟正黑體">生　　日</font></td>
    <td><input style="font-size:20px" type = "date" name = "birth" value = "1997-07-01" /> <br></td>
  </tr>
  <tr>
    <td><font face="微軟正黑體">電　　話</font></td>
    <td><input style="font-size:20px" onkeyup="value=value.replace(/[^\d]/g,'') " type="text" name="phone" /> </td>
  </tr>
  <tr>
    <td><font face="微軟正黑體">居住地址</font></td>
    <td><input style="font-size:20px" type="text" name="ResidenceAddress" /></td>
  </tr>
  <tr>
    <td><font face="微軟正黑體">郵寄地址</font></td>
    <td><input style="font-size:20px" type="text" name="MailingAddress" /></td>
  </tr>
  <tr>
    <td><font face="微軟正黑體">性　　別</font></td>
    <td>
      <label>
        <input type="radio" name="sex" value="Male" id="Sex_0" /><font size="4" face="微軟正黑體">男性
      </label>
      <label>
        <input type="radio" name="sex" value="Female" id="Sex_1" /><font face="微軟正黑體">女性
      </label>
    </td>
  </tr>
</table><br>
  <input size="25" type="submit" name="button" value="確定" style="width:120px;height:40px;font-size:28px;font-family:微軟正黑體;" />
  </div>
</form>
</body>
</html>