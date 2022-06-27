<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Budget Installer</title>
        <link rel="stylesheet" href="css/install.css">
    </head>
    <body>
        <form method="post" action="<?php echo $_SERVER['PHP_SELF'];?>">
            <table width="100%">
                <tr>
                    <td style="text-align:center"><h1>System Configuration and Setup</h1></td>    
                </tr>
            </table>
            <ul class="tabs">
                <li class="tab">
                    <input type="radio" name="tabs" checked="checked" id="tab1" />
                    <label for="tab1">Configuration</label>
                    <div id="tab-content1" class="content">
                        <h3 align="center">Main Configuration</h3>
                        <hr />
                        <table width="100%">
                            <tr>
                                <td valign="top">
                                    <table width="100%">
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><h4>Database Setup</h4></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">MySql Server Name:</td>
                                            <td align="left"><input type="text" id="db_server" name="db_server"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="left" style="font-size:12px">Enter the name of your MySql Server <br />[may be localhost]</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">MySql Server User Name:</td>
                                            <td align="left"><input type="text" id="db_user" name="db_user"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="left" style="font-size:12px">Enter the name of your MySql server user&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">MySql Server User Password:</td>
                                            <td align="left"><input type="text" id="db_pass" name="db_pass"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="left" style="font-size:12px">Enter the password for your MySql server user&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">Database Name:</td>
                                            <td align="left"><input type="text" id="db_name" name="db_name"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="left" style="font-size:12px">Enter the name of your new database&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table width="100%">
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><h4>System Administrator Account Details</h4></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">First Name:</td>
                                            <td align="left"><input type="text" id="adm_fname" name="adm_fname"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="left" style="font-size:12px">Enter your first name.</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">Last Name:</td>
                                            <td align="left"><input type="text" id="adm_lname" name="adm_lname"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="left" style="font-size:12px">Enter your last name.</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">Username:</td>
                                            <td align="left"><input type="text" id="adm_username" name=adm_username></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="left" style="font-size:12px">Set the username for the system administrator.<br />  This will be the Super User of the site</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">Password:</td>
                                            <td align="left"><input type="password" id="adm_password" name="adm_password"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="left" style="font-size:12px">Set the password for the system administrator.</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">Confirm Password:</td>
                                            <td align="left"><input type="password" id="adm_password1" name="adm_password1"</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="left" style="font-size:12px">Confirmthe password for the system administrator.</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="right" style="font-size:12px"><button type="submit" >Submit</button></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </li>
            </ul>    
        </form>
        <?php
        require 'scripts/installer.php';
        if ($_SERVER["REQUEST_METHOD"] == "POST"){
            $dbserv = $_POST['db_server'];
            $dbuser = $_POST['db_user'];
            $dbpass = $_POST['db_pass'];
            $dbname = $_POST['db_name'];
            //echo "Inside the processing loop on inital start <br />";
            if (empty($dbserv)){
                echo '<span style="color:red">MySql Server Name cannot be blank</span>';
            }elseif (empty($dbuser)){
                echo '<span style="color:red">Mysql Server User Name cannot be blank</span>';
            }elseif (empty($dbpass)){
                echo '<span style="color:red">Mysql Server User Password cannot be blank</span>';
            }elseif (empty($dbname)){
                echo '<span style="color:red">Database Name cannot be blank</span>';
            }else{
                $isDbInit = dbsetup($dbserv,$dbuser,$dbpass,$dbname);
                echo "Database init return is " . $isDbInit . "<br />";
                if ($isDbInit == 1){
                    //echo 'It worked';
                }
            }
        }
    ?>
    </body>
</html>