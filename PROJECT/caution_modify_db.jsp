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
String name,student_number,content,password,times;
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
student_number=request.getParameter("student_number");
content=request.getParameter("content");
password=request.getParameter("password");
times=request.getParameter("times");

try{
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl= "jdbc:mysql://localhost:3306/project_db";
	conn= DriverManager.getConnection(jdbcurl,"root","1223");
	stmt = conn.createStatement();
	String sql="update caution_tbl set times="+"'"+times+"',studentnum='"+student_number+"',name='"+name+"'"+"where id="+id;
	stmt.executeUpdate(sql);
	}
	catch(Exception e) {
	out.println("DB 연동오류입니다. : " + e.getMessage() );
	}%>
	out.println("<SCRIPT>parent.location.href='caution.jsp';</SCRIPT>");

</body>
</html>