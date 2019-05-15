<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
int id;
String name,title,content,password;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
if(request.getParameter("id")==null)
{
	id=0;
}
else{
	id=Integer.parseInt(request.getParameter("id"));
}

name=request.getParameter("name");
title=request.getParameter("title");
content=request.getParameter("content");
password=request.getParameter("password");

try{
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl= "jdbc:mysql://localhost:3306/project_db";
	conn= DriverManager.getConnection(jdbcurl,"root","1223");
	stmt = conn.createStatement();
	String sql="update qna_tbl set title="+"'"+title+"'"+",content="+"'"+content+"'"+"where id="+id;
	stmt.executeUpdate(sql);
	}
	catch(Exception e) {
	out.println("DB 연동오류입니다. : " + e.getMessage() );
	}%>
	out.println("<SCRIPT>parent.location.href='Q&A.jsp';</SCRIPT>");

</body>
</html>