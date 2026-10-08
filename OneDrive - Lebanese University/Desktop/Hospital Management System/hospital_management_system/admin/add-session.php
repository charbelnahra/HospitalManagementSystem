<?php

    session_start();

    if(isset($_SESSION["user"])){
        if(($_SESSION["user"])=="" or $_SESSION['usertype']!='a'){
            header("location: ../login.php");
        }

    }else{
        header("location: ../login.php");
    }
    
    
    if($_POST){
       
        include("../connection.php");
        $title=$_POST["title"];
        $docid=$_POST["docid"];
       
        $date=$_POST["date"];
       
        $sql="insert into schedule (docid,title,scheduledate) values ($docid,'$title','$date');";
        $result= $database->query($sql);
        header("location: schedule.php?action=session-added&title=$title");
        
    }


?>