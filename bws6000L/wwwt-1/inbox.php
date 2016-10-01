<?php
session_start();
echo $user;
 ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Inbox</title>
<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:95px;
	height:23px;
	z-index:1;
	left: -220px;
	top: -6px;
}
#Layer2 {
	position:absolute;
	width:80px;
	height:21px;
	z-index:2;
	left: 237px;
	top: 112px;
}
#Layer3 {
	position:absolute;
	width:93px;
	height:21px;
	z-index:3;
	left: 427px;
	top: 112px;
}
.style3 {
	font-size: 36px;
	font-weight: bold;
}
.style4 {color: #CC3300}
-->
</style>
<table width="100%" border="0">
    <tr>
      <td height="107" bgcolor="#0033FF"><div align="center"><span class="style3">Bare Machine WebMail </span></div></td>
    </tr>
</table>
<form id="inboxform" name="inboxform" method="get" action="b_read.php">
 <?php
//session_start();
$message = $_SESSION['msg'];
echo $message;
session_write_close();
?>
 <table width="100%" border="0">
   <tr>
     <td width="5%">No.</td>
     <td width="20%">From</td>
     <td width="20%">Subject</td>
     <td width="20%">Date</td>
   </tr>
   <tr>
     <td width="5%"><label> <input type="submit" name="b_readmsg" value="<?b_msgi?>" /></label></td>
     <td width="20%"><?b_from?></td>
     <td width="20%"><?b_subj?></td>
     <td width="20%"><?b_date?></td>
   </tr>
 </table>
 
</form>
<p><a href="b_mail.php" class="style4">BACK</a></p>
</body>
</html>






























































