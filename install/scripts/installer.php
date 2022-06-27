<?php
/*
    copyright KGA Consulting Service 2021
*/

    function dbconnect($Server,$User,$Pass,$dname){
        $conn = new mysqli ($Server, $User, $Pass);
    return $conn;
    }

    function dbsetup($dbserver, $dbuser, $dbpass,$dbname){
        $conn = dbconnect($dbserver,$dbuser,$dbpass,$dbname);
/*        if($conn){
            echo "We have lift-off<br />";
        }else{
            echo "Huston, we have a problem. . . ";
        } */
        $sql = "select count(*) as valid1 from information_schema.schemata where schema_name = '" . $dbname . "'";
        $result = $conn->query($sql); 
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $b = $row['valid1'];
                if ($b==0){
                    $sql = "create database ".$dbname;
                    //$result = $conn->query($sql);
                    $result = 1;
                }elseif ($b == 1){
                    $result = 2;
                }else{
                    $result =7;
                }
            }
        }else{
            $result = -8;
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
