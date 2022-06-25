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
                                            <td colspan="2"><h4>Database setup</h4></td>
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
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">Database User Name:</td>
                                            <td align="left"><input type="text" id="db_user" name="db_user"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="left" style="font-size:12px">Enter the name of your database user&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">Database User Password:</td>
                                            <td align="left"><input type="text" id="db_pass" name="db_pass"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="left" style="font-size:12px">Enter the password for your database user&nbsp;</td>
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
                                            <td align="right">Email:</td>
                                            <td align="left"><input type="text" id="adm_email" name="adm_email"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="left" style="font-size:12px">Enter the system administrators email address.<br />  This will be the Super User of the site</td>
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
                                            <td align="left" style="font-size:12px">Set the username for the system administrator.</td>
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
            $username = $_POST['UserName'];
            $password = $_POST['Password'];
            //echo "Inside the processing loop on inital start <br />";
            if (empty($username)){
                echo '<span style="color:red">Username cannot be blank</span>';
            }elseif (empty($password)){
                echo '<span style="color:red">Password cannot be blank</span>';
            }else{
                $isValid = validate_login($username,$password);
                //echo "Valid user count is " . $isValid;
                if ($isValid == 1){
                    //$userinfo = get_userinfo($username);
                    //$_SESSION['userId'] = $userinfo[0][emp_id];
                    //$_SESSION['firstname'] = $userinfo[0][fname];
                    //$_SESSION['lastname'] = $userinfo[0][lname];
                    $_SESSION['loggedin'] = 1;
                    header("Location:home.php?q=0");
                    //echo 'It worked';
                }elseif ($isValid == -1) {
                    echo '<span style="color:red">Invalid username<br />Please re-enter</span>';
                }elseif ($isValid == -2) {
                    echo '<span style="color:red">Invalid password<br />Please re-enter</span>';
                }
            }
        }
    ?>
    </body>
</html>