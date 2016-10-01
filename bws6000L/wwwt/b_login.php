<?php
    // if form not yet submitted
    // display form
    if (!isset($_POST['login']))
	{
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html phpns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Bare Webmail Login</title>
<style type="text/css">
<!--
.style3 {
	font-size: 36px;
	font-weight: bold;
}
#Layer1 {
	position:absolute;
	width:242px;
	height:115px;
	z-index:1;
	left: 311px;
	top: 192px;
}
-->
</style>
</head>
<body>
<table width="103%" border="0">
  <tr>
    <td height="107" bgcolor="#0033FF"><div align="center"><span class="style3">Bare Machine WebMail </span></div></td>
  </tr>
</table>
<p><a href="index.html">Home</a>
<p>
<div id="Layer1">
    <form action="" method="post" name="loginform" id="loginform">
    Username: <br />
    <input type="text" name="b_uname" />
    <p>
    Password: <br />
    <input name="b_pword" type="password" />
    <p>
    <input name="login" type="submit" value="Login" />
    <a href="index.html"></a>
    </form>
    <p>
<?php
	//if form submitted
	//check supplied login information
    } else 
    {
	$username = $_POST['b_uname'];
	$password = $_POST['b_pword'];
	//used to check if user entered information
    if (empty($username)) 
    {
	die('Error : please enter your username');
	}
    if (empty($password)) 
    {
	die('Error : please enter your password');
	}
    session_start();
	$_SESSION['b_username'] = $username;
	session_write_close();
    header('Location: b_mail.php');	 
	}
?>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p align="center">&nbsp; </p>
<p>&nbsp;</p>
</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>

