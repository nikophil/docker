<?php
try {
    $dbh = new PDO('mysql:host=localhost;dbname=test', 'root', 'root');
} catch (PDOException $e) {
    print "aaaaErreur !: " . $e->getMessage() . "<br/>";
    die();
}
?>