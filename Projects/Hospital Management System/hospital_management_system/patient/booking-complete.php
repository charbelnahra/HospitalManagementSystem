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


    if($_POST){
        if(isset($_POST["booknow"])){
            $apponum=$_POST["apponum"];
            $scheduleid=$_POST["scheduleid"];
            $date=$_POST["date"];
            $scheduleid=$_POST["scheduleid"];
            $sql2="insert into appointment(pid,apponum,scheduleid,appodate) values ($userid,$apponum,$scheduleid,'$date')";
            $result= $database->query($sql2);
       
            header("location: appointment.php?action=booking-added&id=".$apponum."&titleget=none");

        }
    }
 ?>