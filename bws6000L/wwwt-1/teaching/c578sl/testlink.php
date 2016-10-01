<?
$username="test";
$password="coscYR06";
$database="test";

mysql_connect("10.55.11.168", $username, $password);
@mysql_select_db($database) or die("Unable to select database");
$query="select * from employee";
$result=mysql_query($query);

$num=mysql_numrows($result);

mysql_close();

echo"<b><center>Database output</center><b><br><br>";
echo"<table border = 0><tr><tD><b>First Name</b></tD><tD><b>Last Name</b></tD><tD><b>Address</b></tD><tD><b>Salary</b></tD><tD><b>SSN</b></tD></tr>";

$i=0;
while($i<$num){
$FNAME = mysql_result($result, $i, "FNAME");
$LNAME = mysql_result($result, $i, "LNAME");
$ADDRESS = mysql_result($result, $i, "ADDRESS");
$SALARY = mysql_result($result, $i, "SALARY");
$SSN = mysql_result($result, $i, "SSN");

echo"<tr><td><b>$FNAME</b></td><td><b>$LNAME</b></td><td><b>$ADDRESS</b></td><td><b>$SALARY</b></td><td><b>$SSN</b><td></tr>";
$i++;
}
echo"</table>";
?>