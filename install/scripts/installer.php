<?php
/*
    copyright KGA Consulting Service 2021
*/

    function dbconnect($Server,$User,$Pass){
        //$conn = new mysqli ($Server, $User, $Pass);
        $conn = @mysqli_connect($Server, $User, $Pass);
        if ($conn->connect_error) {
            echo "Unable to connect to DB: " . $conn->connect_error;
            exit;
        }
    return $conn;
    }

    function dbsetup($dbserver, $dbuser, $dbpass,$dbname){
        $conn = dbconnect($dbserver,$dbuser,$dbpass,$dbname);
        $sql = "select * from information_schema.schemata where schema_name = '" . $dbname . "'";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            $result = 2;
        }else{
            $sql = 'CREATE DATABASE ' . $dbname;
            if($conn->query($sql) == TRUE){
                $sql = "USE " . $dbname;
                if($conn->query($sql) == TRUE){
                    $result = 1;
                }else{
                    $result = -1;
                }
            }else{
                echo "Database failed to initialize<br />";
                $result = -1;
            }
        }
        return $result; 
    }

?>
