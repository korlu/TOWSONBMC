<?php
     session_start();
    //$user = $_SESSION['b_username']; 
	//echo $user;
	$uindex = $_SESSION['b_username'];
	echo $uindex;
?>
<?php
 if(!isset($_GET["inbox"])){
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Mail Page</title>
<style type="text/css">
<!--
.style3 {font-size: 36px}
#Layer1 {
	position:absolute;
	width:136px;
	height:115px;
	z-index:1;
	left: 15px;
	top: 148px;
}
#Layer2 {
	position:absolute;
	width:135px;
	height:40px;
	z-index:1;
	left: 32px;
	top: 125px;
}
#Layer3 {
	position:absolute;
	width:60px;
	height:23px;
	z-index:2;
	left: 103px;
	top: 133px;
}
#Layer4 {
	position:absolute;
	width:142px;
	height:26px;
	z-index:3;
	left: 170px;
	top: 125px;
}
#Layer5 {
	position:absolute;
	width:77px;
	height:24px;
	z-index:4;
	left: 258px;
	top: 135px;
}
#Layer6 {
	position:absolute;
	width:759px;
	height:36px;
	z-index:1;
	left: 16px;
	top: 126px;
}
#Layer7 {
	position:absolute;
	width:161px;
	height:28px;
	z-index:2;
	left: 8px;
	top: 22px;
}
#Layer8 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:2;
	left: -1px;
	top: 115px;
}
#Layer9 {
	position:absolute;
	width:534px;
	height:115px;
	z-index:2;
	left: 181px;
	top: 29px;
}
#Layer10 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:2;
	left: 246px;
	top: -6px;
}
.style7 {
	font-family: "Times New Roman", Times, serif;
	color: #0000CC;
}
</style>
</head>
<body>
<table width="103%" border="0">
  <tr>
    <td height="107" bgcolor="#0033FF"><div align="center"><span class="style3">Bare Machine WebMail </span></div></td>
  </tr>
</table>
<p>&nbsp;
</p>
<div id="Layer6">
  <table width="100%" border="0">
    <tr>
      <td colspan="2"><a href="inbox.php" target="_parent"></a>      </td>
      <td width="82%" rowspan="6"><div id="Layer7">
        <form id="inboxform" name="inboxform" method="get" action="inbox.php">
          <label>
          <input type="submit" name="inbox" value=" Inbox" />
          </label>
          <label>          </label>
        </form>
        <label></label>
      </div>
      <div id="Layer9">
        <p class="style7">This is a Bare WebMail System which runs on a Bare PC (i.e. PC without an operating system). It is part of a big research work (Bare Machine Computing). It can send and retrieve emails. </p>
        <p class="style7">Bare Machine Computing Research Lab<br />
          Department of Computer and Information Sciences <br />
          Towson University <br />
          7800 York rd<br />
          Towson, Md</p>
        <p><br />
        </p>
      </div></td>
    </tr>
    <tr>
      <td height="50">&nbsp;</td>
      <td height="50">&nbsp;</td>
    </tr>
    
    <tr>
      <td height="35"><a href="b_compose.php" target="_parent"><img src="http://images.google.com/url?source=imgres&amp;ct=tbn&amp;q=http://www.hd1080stockfootage.com/assets/images/email_button.jpg&amp;usg=AFQjCNFop3Yd1LV_CA5Q7eQJxjs8uGAjZw" alt="k" width="64" height="24" border="0" /></a></td>
      <td width="9%">Compose</td>
    </tr>
    <tr>
      <td height="34"><a href="b_login.php" target="_parent"><img src="http://images.google.com/url?source=imgres&amp;ct=tbn&amp;q=http://www.hd1080stockfootage.com/assets/images/email_button.jpg&amp;usg=AFQjCNFop3Yd1LV_CA5Q7eQJxjs8uGAjZw" alt="k" width="64" height="24" border="0" /></a></td>
      <td width="9%">Logout</td>
    </tr>
    <tr>
      <td width="9%">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td width="9%">&nbsp;</td>
    </tr>
  </table>
</div>
  <label><br />
  </label>
  <label></label>
  <p>  
  </p>
<?php
} else {
  $usermsg = $_POST[$uindex];
  $msgindex = $HTTP_GET_VARS[$usermsg];
  /*int i = 0;
  foreach($msg as $msgindex)
  { 
  i++;
  }
  echo i;*/
  //session_start();
 $_SESSION['msg'] = $msg;
 session_write_close();
       }			
?>
</body>
</html>