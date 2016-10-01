<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>readmail</title>
<style type="text/css">
<!--
.style1 {color: #0000CC}
#Layer1 {
	position:absolute;
	width:100px;
	height:20px;
	z-index:1;
	left: 13px;
	top: 127px;
}
#Layer2 {
	position:absolute;
	width:84px;
	height:21px;
	z-index:2;
	left: 16px;
	top: 40px;
}
#Layer3 {
	position:absolute;
	width:73px;
	height:22px;
	z-index:3;
	left: 110px;
	top: 40px;
}
#Layer4 {
	position:absolute;
	width:65px;
	height:22px;
	z-index:4;
	left: 196px;
	top: 40px;
}
.style3 {
	font-size: 36px;
	font-weight: bold;
}
.style4 {color: #CC3300}
-->
</style>
</head>

<body>
<table width="103%" border="0">
  <tr>
    <td height="107" bgcolor="#0033FF"><div align="center"><span class="style3">Bare Machine WebMail </span></div></td>
  </tr>
</table>
<table width="100%" height="100%" border="0">
  <tr>
    <td height="22" colspan="6" bgcolor="#FFFFFF"><div align="center">
      <div id="Layer1"><strong><span class="style1">Read Email</span></strong></div>
      </div></td>
  </tr>
  <tr>
    <td width="76" height="30" bgcolor="#FFFFFF"><div align="center"><a href="b_compose.php">REPLY</a></div></td>
    <td width="54" bgcolor="#FFFFFF"><a href="b_mail.php" class="style4">BACK</a></td>
    <td width="168" height="30" bgcolor="#FFFFFF"><form action="b_attachment.php" method="get" name="battach" target="_blank" id="attach">
      <label></label>
      <input type="submit" name="b_attach" value="<?b_filename?>" />
    </form>      <a href="b_mail.php" class="style4"></a></td>
    <td width="131" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="131" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="168" height="30" bgcolor="#FFFFFF">&nbsp;</td>
	
  </tr>
  <tr>
    <td width="76"><strong>MailFrom :</strong></td>
    <td colspan="4"><?b_from?></td>
  </tr>
  <tr>
    <td height="10" width="76"><strong>MailTo : </strong></td>
    <td colspan="4"><?b_rcpt?></td>
  </tr>
  <tr>
    <td height="11" width="76"><strong>Subject : </strong></td>
    <td colspan="4"><?b_subj?></td>
  </tr>
  <tr>
    <td height="2000" colspan="6" valign="top"><?b_body?></td>
  </tr>
</table>
<p><a href="b_mail.php" class="style4"></a></p>
<p>&nbsp;</p>
</body>
</html>





























































































