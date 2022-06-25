<?php
/*
    copyright KGA Consulting Service 2021
*/

    function dbconnect($Server,$User,$Pass){
        static $conn;
        if (!$conn) {
            $conn = new mysqli ($Server, $User, $Pass);
            if ($conn->connection_error){
                //trigger_error('Could not connect to MYSql.');
                 die("Connection failed: " . $conn->connect_error) . "<p />\n";
            }
        }    
       return $conn;
    }

    function dbsetup($Server, $User, $Pass, $Dbase){
        $conn = dbconnect($Server,$User,$Pass);
        $sql = "select count(*) as valid1 from information_schema.schemata where schema_name = '".$Dbase."'";
        $result1 = $conn->query($sql);
        if ($result1->num_rows > 0) {
                while($row = $result1->fetch_assoc()) {
                $b = $row[valid1];
                if ($b==0){
                    $sql = "create database ".$Dbase;
                    $result = $conn->query($sql);
                }elseif ($b == 1){
                    $result = 2;
                }
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
