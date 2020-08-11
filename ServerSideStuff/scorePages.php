<?php

$server='localhost';
$username='neuron';
$password='Corvo153';
$database = 'Depths';

$connect= new mysqli($servername,$username,$password, $database);


$resultsOnPage = 7;

$result = $connect->query("SELECT COUNT(*) AS total FROM Scores");


if($result->num_rows > 0)
{
        $data = $result->fetch_assoc();
        echo(ceil($data["total"] / $resultsOnPage));
}
else
{
        echo ("error");
}

$connection->close();

?>
