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
                echo "Database created <br />";
                $result = 1;
            }else{
                echo "Database failed to initialize<br />";
                $result = -1;
            }
        }
        return $result; 
    }

    function dbbuild($mysqlHost, $mysqlUser, $mysqlPassword, $mysqlDatabase){
        // Connect to MySQL server
        $link = mysqli_connect($mysqlHost, $mysqlUser, $mysqlPassword, $mysqlDatabase) or die('Error connecting to MySQL Database: ' . mysqli_error());
        $filename = 'budgetdb.sql';

        $tempLine = '';
        // Read in the full file
        $lines = file($filename);
        // Loop through each line
        foreach ($lines as $line) {

            // Skip it if it's a comment
            if (substr($line, 0, 2) == '--' || $line == '')
                continue;

            // Add this line to the current segment
            $tempLine .= $line;
            // If its semicolon at the end, so that is the end of one query
            if (substr(trim($line), -1, 1) == ';')  {
                // Perform the query
                mysqli_query($link, $tempLine) or print("Error in " . $tempLine .":". mysqli_error());
                // Reset temp variable to empty
                $tempLine = '';
            }
        }
        $b = 1;
        return $b;
    }

?>
