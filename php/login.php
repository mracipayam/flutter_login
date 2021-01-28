<?php

    if($_POST){

        include 'conn.php';


        $username = $_POST['username'];
        $password = $_POST['pass'];

        $consult = $connection->query("SELECT * FROM user WHERE username = '".$username."' and pass = '".$password."'");

        $result = array();

        while($extractdata = $consult->fetch_assoc()){
            $result[] = $extractdata;
        }

        echo json_encode($result);


    }
    else{

        

        echo "hiçbir veri post edilmedi";
        
    }


?>