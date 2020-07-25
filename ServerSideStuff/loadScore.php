<?php

$server='localhost';
$username='neuron';
$password='Corvo153';
$database = 'Depths';

// Create database iiiiiection with correct username and password

$connect= new mysqli($servername,$username,$password, $database);

/* Check the connection is created properly or not */
if($connect->connect_error)
{
	echo "Connection error:" .$connect->connect_error;
}
else
{
	echo "Connection is created successfully";
}

echo ("<br/>");

$scoreOffset = 0;
$resultsOnPage = 10;
if (isset($_GET["page"]))
{
	$scoreOffset = $_GET["page"] * $resultsOnPage;
}

//echo "SELECT * FROM Scores ORDER BY ScoreValue DESC LIMIT " . $scoreOffset . ", " . $resultsOnPage;
$result = $connect->query("SELECT * FROM Scores ORDER BY ScoreValue DESC LIMIT " . $scoreOffset . ", " . $resultsOnPage);
//$result = mysqli_query($connect ,"SELECT * FROM Scores ");

$outputArray = array();

if($result->num_rows > 0)
{
	while($row = $result->fetch_assoc())
	{
		$outputArray[] = $row;
		//echo (" id: " . $row["id"] . " name: " . $row["name"] . " skore: " . $row["skore"] . "<br/>");

	}
	echo json_encode($outputArray);
}	
else
{
	echo ("No record");
}

$connection->close();

?>
