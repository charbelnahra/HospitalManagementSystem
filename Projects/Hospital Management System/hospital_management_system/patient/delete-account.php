<?php

    session_start();

    if(isset($_SESSION["user"])){
        if(($_SESSION["user"])=="" or $_SESSION['usertype']!='p'){
            header("location: ../login.php");
        }else{
            $useremail=$_SESSION["user"];
        }

    }else{
        header("location: ../login.php");
    }
    

  
    include("../connection.php");
    $userrow = $database->query("select * from patients where EMAIL='$useremail'");
    $userfetch=$userrow->fetch_assoc();
    $userid= $userfetch["PATIENT_ID"];
    $username=trim($userfetch["pFIRST_NAME"]." ".$userfetch["pLAST_NAME"]);

    
    if($_GET){
        
        include("../connection.php");
        $id=$_GET["id"];
        $result001= $database->query("select * from patients where PATIENT_ID=$id;");
        $email=($result001->fetch_assoc())["EMAIL"];
        $sql= $database->query("delete from webuser where email='$email';");
        $sql= $database->query("delete from patients where EMAIL='$email';");
        
        header("location: ../logout.php");
    }


?>