<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<div style="height:488px"><br><br><br><br><br><br><br>
	<center>
	
	이름과 학번을 입력하세요. <br><br>
	<form action="find_id2.jsp"  method="post">
	
	이름 : <input type="text" name="my_name">
	학번 : <input type="text" name="student_num">
	<input type="submit" value="확인">
	</form>
	
	</center>
	
</div>
<div id="underbar">
	<img id="logo_white" src="image/logo_white.png"><font color="white" size="2.5"><br><br>&nbsp;&nbsp;&nbsp;서울특별시 중구 필동로 1길 30(우 04620))<br>&nbsp;&nbsp;&nbsp;Copyright ⓒ 2018 BY DONGGUK UNIVERSITY ALL RIGHTS RESERVED.</font></div>

</body>
</html>