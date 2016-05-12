<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改图书信息</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String URL1="jdbc:sqlserver://localhost:1433;DatabaseName=book";
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection con=DriverManager.getConnection(URL1,"sa","123");
	
	Statement stmt=con.createStatement(); 
	String id=request.getParameter("id");
	ResultSet rs=stmt.executeQuery("select * from bookinfo where id="+id);
	rs.next();
%>
<form action="update.jsp" method="post">
<table align="center" width="50%" border="1">
<caption>修改图书信息</caption>
	<tr>
		<th width="30%">书名：</th>
		<td width="70%"><input name="bookname" type="text" value="<%=rs.getString(2)%>"></td>
	</tr>
	<tr>
		<th width="30%">作者：</th>
		<td width="70%"><input name="author" type="text" value="<%=rs.getString(3) %>"></td>
	</tr>
	<tr>
		<th width="30%">价格</th>
		<td width="70%"><input name="price" type="text" value="<%=rs.getString(4) %>">元</td>
	</tr>
	<tr>
	<th colspan=2>
	<input type="hidden" name="id" value="<%=id%>">
	<input type="submit" value="修改">
	<input type="reset" value="重置">
	</th>
	</tr>
</table>
</form>
<%
	rs.close();
	stmt.close();
	con.close();
%>
<center><br><a href="index.jsp">返回</a></center>
</body>
</html>
