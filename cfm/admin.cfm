<html>
 <head>
   <title>My First Forum</title>
 </head>

 <CFIF #isDefined("adminpass")#>
   <CFIF adminpass eq "admin"> <!--- This is only a example file - a secure registration screen was not my intent! --->

     <CFIF not isDefined("UserName")>
         <html>
         <body bgcolor="#ffffff" BACKGROUND="../images/gridpaperbackground2.gif">
         <div align="center">
<!---          <IMG SRC="../images/logo2.gif" BORDER="0" ALT="My First Forum" width="469" height="64"> --->
         <p>
         <form name="form1" action="admin.cfm" method="post">
         <CFOUTPUT><input type="hidden" name="adminpass" value="#adminpass#"></CFOUTPUT>
         <table cellpadding="3" cellspacing="1" border="0">
         <tr><td><font face="Verdana, Arial" color="#000080"><b>User ID:</b> </font></td>
             <td><font size="-1"><input type="text" name="UserName" maxlength="10" size="10"></font></td></tr>
         <tr><td><font face="Verdana, Arial" color="#000080"><b>FirstName:</b>  </font></td>
             <td><font size="-1"><input type="text" name="FirstName" maxlength="20" size="20"></font></td></tr>
         <tr><td><font face="Verdana, Arial" color="#000080"><b>Surname:</b> </font></td>
             <td><font size="-1"><input type="text" name="Surname" maxlength="20" size="20"></font></td></tr>
         <tr><td><font face="Verdana, Arial" color="#000080"><b>Email:</b> </font></td>
             <td><font size="-1"><input type="text" name="Email" maxlength="50" size="25"></font></td></tr>
         <tr><td><font face="Verdana, Arial" color="#000080"><b>Access:</b> </font></td>
             <td><font size="-1"><select name="Access"><option selected>Admin<option>Beta<option>Public</select></font></td></tr>
         <tr><td colspan="2" align="center"><input type="submit" value="Create User"></td></tr>
         </table>
         </form>
         <font face="Verdana, Arial"><b>Make sure all fields are completed</b></font>
         </div>
         </body>
         </html>
         <CFABORT>
     <CFELSE>
         <CFQUERY NAME="Add">
           INSERT INTO Users (UserName, FirstName, Surname, Email, Access, Password)
           VALUES ('#form.UserName#', '#form.FirstName#', '#form.Surname#', '#form.email#', '#form.Access#', '#form.FirstName#')
         </CFQUERY>
         <body bgcolor="#ffffff" BACKGROUND="../images/gridpaperbackground2.gif">
         <h2>User added successfully</h2>
         </body>
         </html>
         <CFABORT>
     </CFIF>
   </CFIF>
 </CFIF>


 <body bgcolor="#ffffff" BACKGROUND="../images/gridpaperbackground2.gif" onLoad="document.form1.adminpass.focus()">
 <div align="center">
<!---  <IMG SRC="../images/logo2.gif" BORDER="0" ALT="My First Forum" width="469" height="64"> --->
 <p>
 <form name="form1" method="post" action="admin.cfm">
 <b>Enter password</b>&nbsp;&nbsp;<input type="password" name="adminpass" size="10" maxlength="10" placeholder="admin">&nbsp;&nbsp;<input type="submit" value="Login">
 </form>
 </body>
 </html>
