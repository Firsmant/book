<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书管理系统</title>
</head>
<body>
<center><a href=add.jsp>添加图书信息</a></center><p>
<table align = "center" width="50%" border = 1>
<tr><th>书名</th><th>作者</th><th>价格</th><th>管理</th></tr>
  <%
		String URL="jdbc:sqlserver://localhost:1433;DatabaseName=book";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection con=DriverManager.getConnection(URL,"sa","123");
		Statement stmt=con.createStatement(); 
		
		String sql="select * from bookinfo";
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			int id=rs.getInt(1);
			out.println("<tr><td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("<td>"+rs.getString(4)+"</td><td><a href='edit.jsp?id="+id+"'>修改</a>;<a href='del.jsp?id="+id+"'>删除</td></tr>");
		}
	%>
	<% 
		rs.close();
		stmt.close();
		con.close();
%>
  </table>
</body>
</html>