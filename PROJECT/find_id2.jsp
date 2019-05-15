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
<% 
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String my_name=request.getParameter("my_name");
String student_num=request.getParameter("student_num");
boolean check_name=false;
boolean check_num=false;
String name_id=null;
String num_id=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl= "jdbc:mysql://localhost:3306/project_db";
	conn= DriverManager.getConnection(jdbcurl,"root","1223");
	stmt = conn.createStatement();
	String sql= "select * from join_tbl";
	rs= stmt.executeQuery(sql);
	}

	catch(Exception e) {
	out.println("DB 연동오류입니다. : " + e.getMessage() );
	}

	while(rs.next()) {
		if(rs.getString("name").equals(my_name))
		{
			check_name=true;
			name_id=rs.getString("id");
	}
		if(rs.getString("student_number").equals(student_num))
		{
			check_num=true;
			num_id=rs.getString("id");
	}	
	}
	if(check_name==true&&check_num==true)
	{
		if(name_id.equals(num_id))
		{
			%>
			<script>
			var name ="<%=my_name%>"+"님의 아이디는"+"<%=name_id%>"+"입니다.";
			alert(name);
			</script>
			
			<%out.println("<SCRIPT>parent.location.href='alpha.html';</SCRIPT>");
		}
	}else{%>
			<script>
			var name ="아이디 또는 학번을 잘못입력하셨습니다.";
			alert(name);
			</script>
			
			<%out.println("<SCRIPT>parent.location.href='alpha.html';</SCRIPT>");
	}%>


</body>
</html>