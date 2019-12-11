<html>
<head>
   <link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<?php
$servername = "10.50.202.242"; // the IP address of your server
$username = "user02" ; // your user name to access the database
$password = "user02" ; // your password to access the database
$dbname = "user02" ; // the database which is already created on the server
$conn = new mysqli($servername , $username , $password , $dbname); // set up connection to the database on the server
if($conn->connect_error) { // print out the error message if connection fails
die("Connection failed :".$conn->connect_error);
}
else { echo " Database connection is successful." ;} 
$sql = "SELECT * FROM xbeetemperature";
$result = $conn->query($sql) ; 
if ($result ->num_rows>0) {
echo "<html> <body> <table class="blueTable">"; 
echo "<thead> <tr> <th> Date </th> <th> Time </th> <th>Temperature </th> </tr> </thead>" ;
while($row = $result -> fetch_assoc ()) { 

$d_date = $row["d_date"]; 

$t_time = $row ["t_time"]; 

$temp = $row["temperature"]; 
echo " <tbody> <tr> <td> $d_date </td> <td> $t_time </td> <td> $temp </td> </tr> </tbody>" ;
}
echo " </table> </body> </html>" ; }
else { echo " 0 result . " ;}
$conn->close();
?>
</body>
</html>