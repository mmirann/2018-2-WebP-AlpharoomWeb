<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.bean.joinDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<head>
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
<%
 request.setCharacterEncoding("UTF-8");
 String name=request.getParameter("name");
 String student_number=request.getParameter("student_number");
 String id=request.getParameter("id");
 String password=request.getParameter("password");
 String passwordconfirm=request.getParameter("passwordconfirm");
 String year=request.getParameter("year");
 String month=request.getParameter("month");
 String day=request.getParameter("day");

%>
<jsp:useBean id="joindto" class="test.bean.joinDTO"/>
<jsp:setProperty property="*" name="joindto"/>

<%
 joinDAO joindao=joinDAO.getInstance();
 joindao.insert(joindto);
%>
<br><br><br>
<center><h2><%=joindto.getName()%>님의 가입을 환영합니다</h2></center>
<table border="0" width="400" height="150" align=center>
  <tr>
            <td>이름</td>
            <td><%=joindto.getName()%></td>
        </tr>
        <tr>
            <td>학번</td>
            <td><%=joindto.getStudent_number() %></td>
        </tr>
        <tr>
            <td>아이디</td>
            <td><%=joindto.getId() %></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><%=joindto.getPassword() %></td>
        </tr>
        <tr>
            <td>생년월일</td>
            <td><%=joindto.getYear() %>.<%=joindto.getMonth() %>.<%=joindto.getDay() %></td>
        </tr>
</table><br>

<center>
 <input type="button" value="홈으로" class="my_button" onclick="javascript:window.location='alpha.html'"/>
</center>

</body>