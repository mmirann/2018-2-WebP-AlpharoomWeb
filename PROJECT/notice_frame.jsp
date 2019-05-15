<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="default_menu.css">
<style>
#notice{
padding:10px;
width:100px;

border-top:1px solid #e0e0e0;
border-right: 1px solid #e0e0e0;
border-left: 1px solid #e0e0e0;
}

#notice_border{
padding:10px;
width:350px;
height:120px;
border-top:1px solid #e0e0e0;
border-right: 1px solid #e0e0e0;
border-left: 1px solid #e0e0e0;
border-bottom: 1px solid #e0e0e0;
}

</style>
</head>
<body>

<div id="notice"><font size="2.5"><center><b>공지사항</b></center></font></div>
<div id="notice_border">
<table width="420"> 
<% int id=0;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql=null;
String time=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl= "jdbc:mysql://localhost:3306/project_db?useUnicode=true&characterEncoding=utf8";
	conn= DriverManager.getConnection(jdbcurl,"root","1223");
	stmt = conn.createStatement();
	sql= "select * from notice_tbl";
	rs= stmt.executeQuery(sql);
	}
	catch(Exception e) {
	out.println("DB 연동오류입니다. : " + e.getMessage() );
	}

while(rs.next()){
	id=Integer.parseInt(rs.getString("id"));
	time=(rs.getString("ts")).substring(0,10);
	%>
<tr>		
<td><font size="2.5"><a href=notice_read.jsp?id=<%=rs.getString("id")%> target="_blank"><%=rs.getString("title") %></a></font></td>
<td><font size="2.5" color="#e57b09"><%=time%></font></td>
</tr>
<%} %>
</table>
</div>
</body>
</html>