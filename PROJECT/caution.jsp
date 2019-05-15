<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.my_td{
height:25px;
}
</style>
<title>Lost&Found</title>
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
<div style="position:relative;margin-left:265px ;width:960px; padding:10px;border:solid 1px #9a9a9a">
<font size="5">경고자 목록<br> </font>
<font size="1">-경고 3번 누적 시 3일간 알파실 출입금지<br>-경고 기준 : 음식물 섭취,자리 사석화,예약하지 않고 자리 사용<br>-누적횟수는 한 학기 기준입니다.</font></div>
<br><br>
 <table align="center" width="1000px" cellpadding="0" cellspacing="0" border="0"> 
<tr align="center" bgcolor="#cccccc">
<td>번호</td>
<td>이름</td>
<td>학번</td>
<td>누적횟수</td>
<td>&nbsp;</td>
 </tr>
<% int id=0,ref=0;
int rownum=0;

String name="", student_number="", times="",my_id="";
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String sql=null;

try{
   Class.forName("com.mysql.jdbc.Driver");
   String jdbcurl= "jdbc:mysql://localhost:3306/project_db?useUnicode=true&characterEncoding=utf8";
   conn= DriverManager.getConnection(jdbcurl,"root","1223");
   stmt = conn.createStatement();
   sql= "select * from caution_tbl";
   rs= stmt.executeQuery(sql);
   }
   catch(Exception e) {
   out.println("DB 연동오류입니다. : " + e.getMessage() );
   }
   

while(rs.next()){
   id=Integer.parseInt(rs.getString("id"));
   name=rs.getString("name");
   student_number=rs.getString("studentnum");
   times=rs.getString("times");
   %>
   


<tr align="center" style="height:45px">
<td><%=id%></td>
<td><%=name%></td>
<td><%=student_number%></td>
<td><%=times %>
<td>

<% if(session.getAttribute("sessionId") == null){
     my_id="";}
else{my_id=session.getAttribute("sessionId").toString();
     if(my_id.equals("admin")){ %>
     <input type="button" class="my_button" value="삭제" onclick="location.href='caution_delete.jsp?id=<%=id%>'"/>
     <input type="button" class="my_button" value="수정" onclick="location.href='caution_modify.jsp?id=<%=id%>'"/>
     <%}} %></td>
</tr>
 <tr height="0.5" bgcolor="#eeeeee"><td id="not" colspan="6"></td></tr>
 <tr><td><input type="hidden" name="id" value="<%=request.getParameter("id")%>"/></td></tr>
<%} %>
</table> 


<br>
<center>
 <%
 if(session.getAttribute("sessionId") == null){
     my_id="";}
else{my_id=session.getAttribute("sessionId").toString();
  if(my_id.equals("admin")){ %>
    <input type="button" id="write" class="my_button" value="글쓰기" onclick="location.href='caution_insert.jsp'"/>
  <%} }%>
</center>
</div>
<div id="underbar">
	<img id="logo_white" src="image/logo_white.png"><font color="white" size="2.5"><br><br>&nbsp;&nbsp;&nbsp;서울특별시 중구 필동로 1길 30(우 04620))<br>&nbsp;&nbsp;&nbsp;Copyright ⓒ 2018 BY DONGGUK UNIVERSITY ALL RIGHTS RESERVED.</font></div>

<% stmt.close();
conn.close();%>

</body>
</html>