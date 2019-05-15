<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="default_menu.css">
</head>
<body>
		<%
		if(session.getAttribute("sessionId")!=null){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		String jdbcurl=null;
		String check_id;
		String seat_num;
		boolean check=false;
		try{
			
		Class.forName("com.mysql.jdbc.Driver");
		jdbcurl = "jdbc:mysql://localhost:3306/project_db?useUnicode=true&characterEncoding=utf8";
		conn = DriverManager.getConnection(jdbcurl, "root", "1223");
		stmt = conn.createStatement();
		sql= "select * from seat_tbl";
		rs= stmt.executeQuery(sql);
		}
		catch(Exception e) {
		out.println("DB 연동오류입니다. : " + e.getMessage() );
		}
		while (rs.next()) {
		check_id=session.getAttribute("sessionId").toString();
		if(rs.getString("name").equals(check_id)) {
			check=true;
		seat_num=rs.getString("seat_num");%>
		<script>
		location.href='leave_db.jsp?seat_num=<%=rs.getString("seat_num")%>';
		</script>
	<%}}
		if(check==false)
		{%>
			<script>
			alert("예약된 좌석이 없습니다.");
			</script>
		<%out.println("<SCRIPT>parent.location.href='seat.jsp';</SCRIPT>");}
		}else{%>
		<script>
		alert("로그인해주세요.")
		</script>
	<%
	out.println("<SCRIPT>parent.location.href='alpha.html';</SCRIPT>");
	}%>
	
</body>
</html>