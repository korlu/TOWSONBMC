<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>compose</title><style type="text/css">
<!--
.style1 {color: #0000CC}
#Layer1 {
	position:absolute;
	width:66px;
	height:25px;
	z-index:1;
	left: 394px;
	top: 252px;
}
#Layer2 {
	position:absolute;
	width:98px;
	height:21px;
	z-index:2;
	left: 11px;
	top: 137px;
}
.style3 {
	font-size: 36px;
	font-weight: bold;
}
-->
</style></head>

<?php 
    // if form not yet submitted
    // display form
    if (!IsSet($_POST["send"])){
?>
<body>
<table width="103%" border="0">
  <tr>
    <td height="107" bgcolor="#0033FF"><div align="center"><span class="style3">Bare Machine WebMail </span></div></td>
  </tr>
</table>


<form action="" method="post" name="compose"  enctype="multipart/form-data" id="compose" >
<table width="90%" height="109%" border="0">
 <tr>
    <td height="24" colspan="2" bgcolor="#FFFFFF"><div align="center">
      <div id="Layer1"></div>
      <div align="left">
        <div id="Layer2"><strong><span class="style1">Write Email </span></strong></div>
      </div>
    </div>      </td>
  </tr>
  <tr>
    <td width="69" height="24"><strong>From : </strong></td>
    <td width="600"><label>
      <input name="b_from" type="text" size="50" maxlength="1000" />
    </label></td>
  </tr>
  <tr>
    <td height="23"><strong>To : </strong></td>
    <td><label>
      <input name="b_to" type="text" size="50" maxlength="1000" />
    </label></td>
  </tr>
  <tr>
    <td height="10"><strong>Subject : </strong></td>
    <td width="600"><label>
      <input name="b_subject" type="text" size="50" maxlength="1000" />
    </label></td>
  </tr>
  <tr>
    <td height="11"><strong>Attachment : </strong></td>
    <td><label>
      
	   
	  </label>    <input type="file" name="b_file" />
	  <input name="send" type="submit" id="Send" value="  Send  " />
 </td>
  </tr>
  <tr>
    <td height="281" colspan="2"><label>
      <textarea name="b_msgbody" cols="78" rows="17"></textarea>
    </label></td>
  </tr>
</table>
</form>
<?php 
	//if form submitted
	//check supplied login information
	} else {
	$from = $_POST['b_from'];
	$to = $_POST['b_to'];
	$subject = $_POST['b_subject'];
	$msgbody = $_POST['b_msgbody'];
	//used to check if user entered information
	if (empty($from)) {
	die('Error : please enter mail from');
	}
	if (empty($to)) {
	die('Error : please enter mail to');
	}
    header('Location: b_mail.php');
    }
?>
<p>&nbsp;</p>
</body>
</html>
