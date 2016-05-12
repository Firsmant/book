<%@ page language="java" import="java.sql.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改成功</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String bookname=request.getParameter("bookname");
	String author=request.getParameter("author");
	String price=request.getParameter("price");
	String id=request.getParameter("id");
	
	String URL="jdbc:sqlserver://localhost:1433;DatabaseName=book";
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection con=DriverManager.getConnection(URL,"sa","123");
	Statement stmt=con.createStatement(); 
	String sql="update bookinfo set bookname='"+bookname+"',author='"+author+"',price="+price+" where id="+id;
	int i=stmt.executeUpdate(sql);
	
	if(i==1)
	{
		out.println("<script lanuage='javaScript'>alert('修改成功，单击确定后自动跳转到主页。')</script>");
		response.setHeader("refresh","1;url=index.jsp");
	}
	stmt.close();
	con.close();
%>
</body>
</html>