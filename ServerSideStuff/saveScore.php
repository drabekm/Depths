<?php

// Saves player score into a database
// Maybe I should've made this in something different than php
// I feel like anything I make in this is just so unprofesionally made
// It would probably be better if I used some sort of framework.
// But using any kind of framework for this shit would be overkill

$server='localhost';
$username='neuron';
$password='Corvo153';
$database = 'Depths';

$playerNameParameterName = 'playerName'; //GET parameter names
$playerScoreValueParameterName = 'playerValue';

$connect= new mysqli($servername,$username,$password, $database);

$name = $_GET[$playerNameParameterName];
$score = $_GET[$playerScoreValueParameterName];


if (isset($_GET['playerName']) && isset($_GET["scoreValue"]))
{
	$connect->query("INSERT INTO Scores (ScoreID, ScorePlayerName, ScoreValue) VALUES (null, '" . $name . "', " . $score . ")");
	echo("Score succesfully added!");
}
$connect->close();

?>