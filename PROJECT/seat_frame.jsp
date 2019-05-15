<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="default_menu.css">

<title>Insert title here</title>
<style>
#seat {
	padding: 10px;
	width: 100px;
	border-top: 1px solid #e0e0e0;
	border-right: 1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
}

#seat_border {
	padding: 10px;
	width: 350px;
	height: 120px;
	border-top: 1px solid #e0e0e0;
	border-right: 1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	border-bottom: 1px solid #e0e0e0;
}
</style>
</head>
<body>
	<div id="seat">
		<font size="2.5"><center>
				<b>좌석 예약</b>
			</center></font>
	</div>
	<div id="seat_border"><br>
		<table width="230" align="center">
		 <tr width="20" bgcolor="#ffffff" ><td rowspan="3"></td></tr>
			<tr>
				<td><font size="2.5">사용 가능 좌석 </font></td>
				<td><font size="2.5">내 좌석</font></td>
			</tr>
			<% 

int count=0;
String check_id;
String my_state=null;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
boolean my_seat = false;
boolean logout=false;
try {
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl = "jdbc:mysql://localhost:3306/project_db";
	conn = DriverManager.getConnection(jdbcurl, "root", "1223");
	stmt = conn.createStatement();
	String sql_update = "select * from seat_tbl";
	rs = stmt.executeQuery(sql_update);
} catch (Exception e) {
	out.println("DB 연동오류입니다. : " + e.getMessage());
}

while (rs.next()) {
	if(session.getAttribute("sessionId")==null){
		logout=true;}
	else if(rs.getString("name").equals(session.getAttribute("sessionId").toString())) {
		my_seat=true;
		}
if(Integer.parseInt(rs.getString("state"))==0){
	count++;}
}if(my_seat==true)
{
	my_state="좌석 사용 중";
}else if(logout==true)
{
	my_state="로그인해주세요.";
}
else{
	my_state="좌석 사용 가능";
}
	%>
			<tr>
				<td><font size="2.5"><font color="#e57b09"><%=count%></font>/48</font></td>
				<td><font size="2.5"><font color="#e57b09"><b><%=my_state%></b></font></td>
			</tr>
		</table><br>
<center>
		<input type="button" class="my_button" value="좌석 현황" onclick="window.open('seat.jsp')">
	<script type="text/javascript" src="practice.js"> </script>
	</center>
	</div>
	<%stmt.close();
rs.close();
%>
</body>
</html>