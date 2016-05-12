<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除图书信息</title>
</head>
<body>
 <%
 	request.setCharacterEncoding("UTF-8");
	String URL1="jdbc:sqlserver://localhost:1433;DatabaseName=book";
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection con=DriverManager.getConnection(URL1,"sa","123");
	Statement stmt=con.createStatement(); 
	String id=request.getParameter("id");
	int i=stmt.executeUpdate("delete from bookinfo where id="+id);
	if (i==1)
	{
		out.println("<script language='javaScript'> alert ('删除成功，单击确定后自动跳转到主页！！');</script>");
		response.setHeader("refresh","1;url=index.jsp");
	}
	else
	{
		out.println("<script language='javaScript'> alert ('删除失败，单击确定后自动跳转到主页！！');</script>");
		response.setHeader("refresh","1;url=index.jsp");
	}
	con.close();
	stmt.close();
%>
</body>
</html>