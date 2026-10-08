<?php

    $database= new mysqli("localhost","root","","hospital_management_system");
    if ($database->connect_error){
        die("Connection failed:  ".$database->connect_error);
    }

?>