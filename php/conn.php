<?php

    $connection = new mysqli("localhost", "root", "", "login");

    if (!$connection) {
        echo "connection failed!";
        exit();
    }else{
        //echo "connection succesful";
    }
?>