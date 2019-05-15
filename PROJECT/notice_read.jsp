<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<link rel="stylesheet" type="text/css" href="default_menu.css">
</head>
<body>
<br>
	<div id="top">
		<a href="alpha.html"> <img src="image/alpha.png" width="280"
			height="50" alt="컴퓨터공학과 알파실" title="컴퓨터공학과 알파실"></a>
	<iframe src="login_menu.jsp" style="width:250px; height:32.5px; border:0" scrolling = "no"></iframe>
			<img src="image/seat_no.png" width="260" height="50">
		<button type="button" class="button_other" onclick="location.href='join.jsp'">회원가입</button>
		<button type="button"  class="button_other" onclick="location.href='alpha.html'">HOME</button>
		<button type="button"  class="button_other" onclick="location.href='http://www.dongguk.edu/'">DGU</button>
	</div>



	<div class="menubar">
		<center>
			<ul>
				<li><a href="notice.jsp">공지사항</a></li>
				<li><a href="Q&A.jsp">커뮤니티</a>
					<ul>
						<li><a href="seat.jsp">좌석예약</a></li>
						<li><a href="caution.jsp">경고자목록</a></li>
						<li><a href="lost&found.jsp">분실물 센터</a></li>
						<li><a href="Q&A.jsp">Q&A</a></li>
					</ul></li>
				<li><a href="info.html">안내</a></li>
			</ul>
		</center>
	</div>
	
	<br>
	<img src="image/seat_no.png" width="260" height="10">
<font size="5">Notice </font>
<font size="1">-공지사항</font>
<br><br>
<%
int id=0,ref=0;
String temp;
String name="",date="",title="",content="";
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String my_id="";  

id=Integer.parseInt(request.getParameter("id"));

try{
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl= "jdbc:mysql://localhost:3306/project_db";
	conn= DriverManager.getConnection(jdbcurl,"root","1223");
	stmt = conn.createStatement();
	String sql= "select * from notice_tbl where id="+id;
	rs= stmt.executeQuery(sql);
	}
	catch(Exception e) {
	out.println("DB 연동오류입니다. : " + e.getMessage() );
	}

	while(rs.next()) {
		name=rs.getString("name");
		title=rs.getString("title");
		content=rs.getString("content");
		date=rs.getString("ts");
	}
%>
	<div style="height:488px">
<table align="center" width="1000px" cellpadding="0" cellspacing="0" border="0">
<tr>
<td>제목</td>
<td><%=title%></td>
 <tr height="0.5" bgcolor="#eeeeee"><td colspan="6"></td></tr>
</tr>
<tr>
<td>이름</td>
<td><%=name%></td>
</tr>
 <tr height="0.5" bgcolor="#eeeeee"><td colspan="6"></td></tr>
</table>

<br>
<div style="border: 1px solid #eeeeee; height: auto;width:975px; position:relative; margin-left:250px; padding:10px;"><%=content.replace("\r\n", "<br>") %></div>
<p>

<center>
  <input type="button" class="my_button" value="목록" onclick="location.href='notice.jsp'"/>
  <%if(session.getAttribute("sessionId")!=null){
		  my_id=session.getAttribute("sessionId").toString();}
  if(my_id.equals("admin")){ %>

<input type="button" class="my_button" value="수정" onclick="location.href='notice_modify.jsp?id=<%=id%>'"/>
<input type="button" class="my_button" value="삭제" onclick="location.href='notice_delete.jsp?id=<%=id%>'"/>
  <%} %></center>
</div>
<div id="underbar">
	<img id="logo_white" src="image/logo_white.png"><font color="white" size="2.5"><br><br>&nbsp;&nbsp;&nbsp;서울특별시 중구 필동로 1길 30(우 04620))<br>&nbsp;&nbsp;&nbsp;Copyright ⓒ 2018 BY DONGGUK UNIVERSITY ALL RIGHTS RESERVED.</font></div>

</body>
</html>