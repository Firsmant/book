<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加图书信息</title>
</head>
<body>
<form action="add.jsp" method="post"> <!--action:处理请求的文件 form:提交表达的方式 method:提交方式 -->
<table align="center" width="50%" border="1">
<caption>添加图书信息</caption>     <!-- 标题 -->
 <tr>
   <th width="25%">书名：</th>
   <td width="75%"><input name="bookname" type="text"></td>
 </tr>
 <tr>
   <th width=25%>作者：</th>
   <td width="75%"><input name="author" type="text"></td>
 </tr>
 <tr>
   <th width=25%>价格：</th>
   <td width="75%"><input name="price" type="text">元</td>
 </tr>
 <tr>
   <th colspan="2">
   <input type="submit" name="submit" value="添加">
   <input type="reset" value="重置"> 
   </th>
 </tr>
</table>
</form>
<center><br><a href="index.jsp">返回</a></center>
<%
	request.setCharacterEncoding("UTF-8");
	String submit=request.getParameter("submit");
	if(submit!=null&&!submit.equals(""))
	{
		String bookname=request.getParameter("bookname");
		String author=request.getParameter("author");
		String price=request.getParameter("price");
		
		String URL1="jdbc:sqlserver://localhost:1433;DatabaseName=book";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection con=DriverManager.getConnection(URL1,"sa","123");
		Statement stmt=con.createStatement(); 
		String sql="insert into bookinfo(bookname,author,price) values('"+bookname+"','"+author+"','"+price+"')";
		int i=stmt.executeUpdate(sql);
		if(i==1)
		{
			out.println("<script language='javaScript'> alert('添加成功，单击确定跳转到主页！')</script>");
			response.setHeader("refresh","1;url=index.jsp");
		}
		else
		{
			out.println("<script language='javaScript'> alert('添加失败，单击确定返回添加页面')</script>");
			response.setHeader("refresh","1;url=add.jsp");
		}
		stmt.close();
		con.close();
	}
	
%>
</body>
</html>