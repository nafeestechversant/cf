<cfparam name="attributes.title" default="My App" >
<CFIF #isDefined("Fwho")#>
  <CFQUERY NAME="login">
    SELECT FirstName, UserName,LastLogin FROM Users WHERE Username = '#Fwho#'
  </CFQUERY>
  <html>
  <head>
  <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
  <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <title><cfoutput>#attributes.title#</cfoutput></title>
  </head>
  <body BGCOLOR="#FFFFFF" BACKGROUND="../images/gridpaperbackground2.gif">
  <div align="center">
  <!--<IMG SRC="../images/logo2.gif" BORDER="0" ALT="My First Forum" width="469" height="64">-->
  <p>
  <CFIF #login.recordcount# eq 1>
    <CFCOOKIE NAME="Fwho" VALUE="#Fwho#">
    <font color="#0000ff"><b>Login successful</b></font>
    <p><b>Good <CFIF hour(now()) gt 0 and hour(now()) lt 12>Morning<CFELSE>Afternoon</CFIF>&nbsp;<CFOUTPUT>#login.Firstname#</CFOUTPUT></b>
<!---     <p><b>You can now view the restricted bulletin boards.</b> --->
<!---     <p>Click <a href="board.cfm">here</a> to proceed. --->
    <p><br><font size="1" face="Verdana, Arial">Last login on: <CFOUTPUT>#dateformat(login.LastLogin,"dd-mm-yy")#</CFOUTPUT></font>
    <CFQUERY NAME="UpdateLogin">
      UPDATE Users SET LastLogin = #now()# WHERE Username = '#Fwho#'
    </CFQUERY>
    <CFABORT>
  <CFELSE>
    <font color="#ff0000"><b>Login failed</b></font>
    <CFABORT>
  </div></body></html>
  </CFIF>
</CFIF>

<html>
 <head>
   <title><cfoutput>#attributes.title#</cfoutput></title>
 </head>
 <body bgcolor="#ffffff" BACKGROUND="../images/gridpaperbackground2.gif" onLoad="document.form1.Fwho.focus()">
 <div align="center">
<!---  <IMG SRC="../images/logo2.gif" BORDER="0" ALT="My First Forum" width="469" height="64"> --->
 <p>
 <form name="form1" method="post" action="login.cfm">
 <table width="75%" cellpadding="0" cellspacing="0">
<!---  <tr><td><FONT face="Verdana, Arial" color="#000080">Certain forums may only be viewed by authorised users. --->
<!---  <p>Click <a href="mailto:admin@myforum.com">here</a> to request a User ID or login below.</font><p><br></td></tr> --->

 <tr><td align="center">
   <b>Enter your User ID:</b>  <input type="password" name="Fwho" size="10" maxlength="10">&nbsp;&nbsp;<input type="submit" value="Login">
 </td></tr>
 </table>
 </form>
 </body>
 </html>
