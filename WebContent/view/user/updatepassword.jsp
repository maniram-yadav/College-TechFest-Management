<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Password</title>
</head>
<body>
  <form action="UpdatePass.jsp" method="post">
  <table><tr><td>New Password :</td><td> <input type="password" name="pass" placeholder="Enter password"/></td></tr>
  <tr><td>Reenter New Password:</td><td><input type="password" name="repass" placeholder="Renter password"/></td></tr>
  <tr><td></td><td><input type="submit" name="submit" class="btn btn-success" value="Change"/></td></tr>

</form>

</body>
</html>