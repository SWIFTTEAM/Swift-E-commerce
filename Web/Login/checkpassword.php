<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php session_start(); ?>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>checkpassword</title>
</head>

		<link href="style.css" rel="stylesheet" type="text/css" />
		<script type="text/ja	vascript">
			function onCheck()
			{
				if(document.getElementById("input-username").value=="")
				{
					document.getElementById("msg-username").innerHTML="帳號不可為空";
				}
				else
				{
					document.getElementById("msg-username").innerHTML="";
				}
				if(document.getElementById("input-password").value=="")
				{
					document.getElementById("msg-password").innerHTML="密碼不可為空";
				}
				else
				{
					document.getElementById("msg-password").innerHTML="";
				}
				if(document.getElementById("input-username").value!=""&&document.getElementById("input-password").value!="")
				{
					document.getElementById("form-login").action="checkpassword-2.php";
					document.getElementById("form-login").submit();
				}
			}
			
		</script>
	</head>
	<body>

		<form id="form-login" name="form" method="post">
			<table>
				<tr>
					<td>帳號</td>
					<td><input id="input-username" name="username" type="text" /></td>
					<td><div id="msg-username" class="alert"></div></td>
				</tr>
				<tr>
					<td>密碼</td>
					<td><input id="input-password" name="password" type="password" /></td>
					<td><div id="msg-password" class="alert"></div></td>
				</tr>
			</table>
			<button onclick='onCheck()'>登入</button>
			
		</form>
           
	</body>
</html>