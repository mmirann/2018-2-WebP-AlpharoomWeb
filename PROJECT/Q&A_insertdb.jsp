<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int temp=0;
int id=0,ref=0;
int new_id=0;
String name,title,content,reply,password;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql_update;
String now="now()";
try{
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl= "jdbc:mysql://localhost:3306/project_db";
	conn= DriverManager.getConnection(jdbcurl,"root","1223");
	stmt = conn.createStatement();
	String sql= "select max(id) as max_id from qna_tbl";
	rs= stmt.executeQuery(sql);
	}

	catch(Exception e) {
	out.println("DB 연동오류입니다. : " + e.getMessage() );
	}

	while(rs.next()) {
		if(rs.getString("max_id")==null)
		{new_id=0;}
		else{
		new_id=Integer.parseInt(rs.getString("max_id"));
		}
	}
	new_id++;

	title=request.getParameter("title");
	content=request.getParameter("content");
	reply=request.getParameter("reply");
	password=request.getParameter("password");
	
	
	if("y".equals(reply)){
		ref=Integer.parseInt(request.getParameter("ref"));
	} else{
		ref=new_id;
	}
	
	sql_update="insert into qna_tbl values ("+new_id+","+"'"+session.getAttribute("sessionName")+"'"+","+"'"+title+"'"+","+"'"+content+"'"+","+ref+","+"'"+password+"'"+","+now+")";


stmt.executeUpdate(sql_update);
out.println("<SCRIPT>parent.location.href='Q&A.jsp';</SCRIPT>");
%>
</body>
</html>