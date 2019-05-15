<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
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

	<div style="height:488px">
<img src="image/seat_no.png" width="260" height="10">
<font size="5">Q&A </font>
<font size="1">-궁금한 점이 있으면 글을 남겨주세요.</font>
<br><br>

<table align="center" width="1000px" cellpadding="0" cellspacing="0" border="0"> 
<tr align="center" bgcolor="#cccccc">
<td>번호</td>
  <td>제목</td>
  <td>이름</td>
  <td>등록일자</td>
  <td>&nbsp;</td>
 </tr>
 
 
<% int id=0,ref=0;
int rownum=0;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql=null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcurl= "jdbc:mysql://localhost:3306/project_db?useUnicode=true&characterEncoding=utf8";
	conn= DriverManager.getConnection(jdbcurl,"root","1223");
	stmt = conn.createStatement();
	sql= "select * from qna_tbl where id=1";
	rs= stmt.executeQuery(sql);
	}
	catch(Exception e) {
	out.println("DB 연동오류입니다. : " + e.getMessage() );
	}

while(rs.next()){
	%>
<tr height="25" align="center" bgcolor="#ececec">
<td>[공지]</td>
<td><a href=Q&A_read.jsp?id=<%=rs.getString("id")%>><%=rs.getString("title") %></a></td>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("ts") %></td>
<td>&nbsp;</td>
<tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
	

<%}
	sql= "select * from qna_tbl order by ref desc, id asc";
	rs= stmt.executeQuery(sql);
	rs.last();
	rownum=rs.getRow();
	rs.beforeFirst();
			
	while(rs.next()) {
		id=Integer.parseInt(rs.getString("id"));
		ref=Integer.parseInt(rs.getString("ref"));		
%>

  <tr height="25" align="center">
  <td><%=rownum %></td>
  <td><%if(id!=ref)out.println("⤷");%><a href=Q&A_read.jsp?id=<%=rs.getString("id")%>><%=rs.getString("title") %></a></td>
  <td><%=rs.getString("name") %></td>
  <td><%=rs.getString("ts") %></td>
  <td>&nbsp;</td>
 <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
 <%rownum--; }%>
</table>

<br>
<center>
<input type="button" class="my_button" value="글쓰기" onclick="location.href='Q&A_insert.jsp'">
</center>
<% stmt.close();
conn.close();%>
</div>
<div id="underbar">
<img id="logo_white" src="image/logo_white.png"><font color="white" size="2.5"><br><br>&nbsp;&nbsp;&nbsp;서울특별시 중구 필동로 1길 30(우 04620))<br>&nbsp;&nbsp;&nbsp;Copyright ⓒ 2018 BY DONGGUK UNIVERSITY ALL RIGHTS RESERVED.</font></div>

</body>
</html>