<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<meta charset="UTF-8">
<title>좌석 예약</title>
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
			</center></div>
	
	<br>
<script>
	$(document).ready(
				function() {
					$("img").hover(
							function() {	
								var src=$(this).attr("src");
								if(src=="image/seat_ok.png")
									{
									$(this).attr("src","image/seat_select.png");
									}
							},	
							function(){
								var src=$(this).attr("src");
							if(src=="image/seat_select.png")
							{
								$(this).attr("src","image/seat_ok.png");
								}}
							
					
					);});
				
</script>
<iframe src="seat_after12.jsp" style="visibility:hidden;display:none"></iframe>
<div style="position:relative;margin-left:265px ;width:960px; padding:10px;border:solid 1px #9a9a9a">
	<font size="5"> 좌석예약 </font><br>
	<font size="2">- 좌석은 한자리만 예약 가능합니다.<br> - 퇴실하실 땐 꼭 퇴실
		처리해주세요.<br>- 예약을 원하는 좌석을 클릭해주세요.<br> - 모든 좌석은 자정이 지나면 퇴실됩니다.<br>
	</font></div><center></center>
	<br>
	<center>
		<font size="4"><b>알파실 좌석현황</b></font>
	</center>
<hr width="240">
	<div id="total">
		<% 
			Connection conn = null;
			Statement stmt1 = null;
			Statement stmt = null;
			ResultSet rs = null;
			String sql = null;
			String jdbcurl=null;
			String time=null;
			String my_name=null;
			int hour=0;
			int min=0;
			int count_out=0;
			boolean timeout=false;
			String now="now()";
			if (session.getAttribute("sessionId") == null) {
				my_name="";
			}else{
			my_name=session.getAttribute("sessionId").toString();}
			int count = 1;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				jdbcurl = "jdbc:mysql://localhost:3306/project_db?useUnicode=true&characterEncoding=utf8";
				conn = DriverManager.getConnection(jdbcurl, "root", "1223");
				stmt = conn.createStatement();
				sql = "select * from seat_tbl";
				rs = stmt.executeQuery(sql);
			} catch (Exception e) {
				out.println("DB 연동오류입니다. : " + e.getMessage());
			}

			while (rs.next()) {

				int state = Integer.parseInt(rs.getString("state"));
				int seat_num = Integer.parseInt(rs.getString("seat_num"));
				String seat_src = "";

				if (state == 0) {
					seat_src = "image/seat_ok.png";
				}
				else if (state == 1) {
					if(rs.getString("name").equals(my_name))
					{
						seat_src = "image/seat_mine.png";
					}else{
					seat_src = "image/seat_used.png";}
					
				time=rs.getString("ts");
				hour=Integer.parseInt(time.substring(11,13));
				min=Integer.parseInt(time.substring(14,16));
			Calendar cal=Calendar.getInstance();
			
			if((hour+3)==cal.get(Calendar.HOUR_OF_DAY)&&min<cal.get(Calendar.MINUTE)){
				stmt1 = conn.createStatement();
				String out_sql= "update seat_tbl set state=0,name="+"'"+"'"+"where seat_num="+seat_num;
				stmt1.executeUpdate(out_sql);
			}
			else if((hour+3)<cal.get(Calendar.HOUR_OF_DAY)){
					stmt1 = conn.createStatement();
					String out_sql= "update seat_tbl set state=0,name="+"'"+"'"+"where seat_num="+seat_num;
					stmt1.executeUpdate(out_sql);
				}
					} else if (state == 2) {
					seat_src = "image/seat_mine.png";
				} else if (state == 3) {
					seat_src = "image/seat_no.png";
				}
		%>
		
		<div id="first">
			<a href=seat_res.jsp?seat_num=<%=rs.getString("seat_num")%>><img
				src=<%=seat_src%> width="30" height="30" border="0"></a>
		</div>
		<%
			if (count % 6 == 0) {
		%>
		<br>
		<br>
		<%
			}
				if (count % 12 == 0) {
		%>
		<hr>
			<%}
			count++;
			}
			%>		
			 
	<img src="image/seat_ok.png" width="15" height="15"> <font size="1">:사용 가능</font>
		<img src="image/seat_used.png" width="15" height="15">  <font size="1">:사용 불가</font>
			<img src="image/seat_mine.png" width="15" height="15">  <font size="1">:내 좌석</font>


<img src="image/seat_no.png" width="70" height="15">
	<iframe src="leave_seat.jsp" style="width:80px; height:33px; border:0" scrolling="no"></iframe>	
	</div>
	<br><br><br><br><br><br><br><br><br><br>
<div id="underbar">
	<img id="logo_white" src="image/logo_white.png"><font color="white" size="2.5"><br><br>&nbsp;&nbsp;&nbsp;서울특별시 중구 필동로 1길 30(우 04620))<br>&nbsp;&nbsp;&nbsp;Copyright ⓒ 2018 BY DONGGUK UNIVERSITY ALL RIGHTS RESERVED.</font></div>


</body>
</html>