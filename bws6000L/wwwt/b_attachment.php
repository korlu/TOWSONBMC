
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Attachment</title>
<style type="text/css">
<!--
.style4 {
	font-size: 36px;
	font-weight: bold;
}
-->
</style>
</head>
<?php
    // if form not yet submitted
    // display form
    if (!IsSet($_POST["add"]))
	{
?>
<body>
<table width="100%" border="0">
  <tr>
    <td height="107" bgcolor="#0033FF"><div align="center">
      <p><span class="style4">Bare Machine WebMail </span></p>
      </div></td>

  </tr>
  <tr>
    <td><?b_attach?></td>
  </tr>
</table>
</body>
</html>
