<?
$username='root';
$password='COSCyr06$$';
$database='test';

mysql_connect('10.55.7.14:3306', $username, $password);
@mysql_select_db($database) or die('Unable to select database');

$query='select name, spec from dstudent';

$result=mysql_query($query);

$num=mysql_numrows($result);

mysql_close();

echo'<table border = 0>';

$i=0;
while($i<$num){
$FNAME = mysql_result($result, $i, 'name');
$SSN = mysql_result($result, $i, 'spec');
$i++;
}
echo'</table>';
?>

