<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Budget Installer</title>
        <link rel="stylesheet" href="css/install.css">
    </head>
    <body>
        <table width="100%">
        <tr>
            <td style="text-align:center"><h1>System Configuration and Setup</h1></td>    
        </tr>
        </table>
        <ul class="tabs">

            <li class="tab">
                <input type="radio" name="tabs" checked="checked" id="tab1" />
                    <label for="tab1">1.  Configuration</label>
                    <div id="tab-content1" class="content">
                        <h3>Main Configuration</h3>
                        <hr />
                        <table width="100%">
                            <tr>
                                <td valign="top">
                                    <table width="100%">
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right">Company Name:</td>
                                            <td align="left"><input type="text" id="comp_name" name="comp_name"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="left" style="font-size:12px">Enter your company name&nbsp;</td>
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
											<td>&nbsp;</td>
											<td align="right" style="font-size:12px"><button type="button" >Next</button></td>
										</tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
            </li>

            <li class="tab">
              <input type="radio" name="tabs" id="tab2" />
              <label for="tab2">2.  Database</label>   
                <div id="tab-content2" class="content">
                     <h3>Database Configuration</h3>
                     <hr />
					 Put Database Configurations Here
				</div>
            </li>

             <li class="tab">
              <input type="radio" name="tabs" id="tab3" />
              <label for="tab3">3.  Overview</label>   
                  <div id="tab-content3" class="content">
                    <h3>Finalization</h3>
                    <hr />
                    <h3>Overview</h3>
                    <hr />
                  </div>
            </li>

          </ul>
    </body>
</html>