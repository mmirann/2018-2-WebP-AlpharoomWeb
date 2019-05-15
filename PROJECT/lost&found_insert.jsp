<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
  <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="default_menu.css">
  <script type="text/javascript"> 
  $(function(){
	
			$('#fiad').change( function(event) {
				var tmppath = URL.createObjectURL(event.target.files[0]);
			$("#img_path").attr('value',tmppath);
			});
  });  
  </script>
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
	
	<%
		if (session.getAttribute("sessionId") == null) {
	%>
	<script>
		alert("로그인해주세요.");
	</script>
	<%
		out.println("<SCRIPT>parent.location.href='lost&found.jsp';</SCRIPT>");
		} else {%>
		<div style="height:488px">
<img src="image/seat_no.png" width="260" height="10">
<font size="5">분실물센터</font>
<font size="1"></font>
<br>

<table align="center" width="1000px" cellpadding="0" cellspacing="0" border="0">
 <tr>
  <td>
   <form name="addForm" method="post" target="action" action="lost&found_insertdb.jsp" onSubmit='return chkForm(this)'>
 

    <tr align="center" bgcolor="#cccccc">
        <td>게시글 작성</td>
     </tr>
   </table>
   
<table align="center" width="1000px"> 

    <tr>
     <td>제목&nbsp;</td>
     <td><input name="title" style="width:939px" maxlength="100"></td>
    </tr>
    <tr height="1" bgcolor="#cccccc"><td colspan="2"></td></tr>
    <tr>
     <td>이름&nbsp;</td>
     <td><%= session.getAttribute("sessionName")%></td>
    </tr>
    <tr height="1" bgcolor="#cccccc"><td colspan="2"></td></tr>
    <tr>
     <td>내용&nbsp;</td>
     <td><textarea name="content"  cols="145" rows="13"></textarea></td>
    </tr>
        <tr>
     <td>비밀번호&nbsp;</td>
     <td><input type="password" name="password" size="10%" maxlength="50"></td>
    </tr>
    <tr height="1" bgcolor="#cccccc"><td colspan="2"></td></tr>
      <tr>
     <td>&nbsp;</td>
     <td>첨부&nbsp;</td>
     <td>
      <input type="button" value="첨부" onclick="window.open('upload.jsp')">
     <td>&nbsp;</td>
    </tr>
    <tr height="1" bgcolor="#cccccc"><td colspan="4"></td></tr>
     <tr height="3" bgcolor="#ffffff" ><td colspan="2"></td></tr>
 <tr align="center">

     <td colspan="2"><input type="image" src="image/write.png"  width="50" height="25" border="0">
      <a href="lost&found.jsp"><img src="image/cancel.png"  width="50" height="25" border="0"></a></td>
     <td>&nbsp;</td>
    </tr>
   </table>
   <% 
   String flag=request.getParameter("flag");
   if("r".equals(flag)){ %>
	<input type=hidden name=ref value="<%=request.getParameter("ref")%>">
   <input type=hidden name=reply value="y">
   <%}else{%> 
   <input type=hidden name=reply value="n">
<%}} %>
</div>
<div id="underbar">
	<img id="logo_white" src="image/logo_white.png"><font color="white" size="2.5"><br><br>&nbsp;&nbsp;&nbsp;서울특별시 중구 필동로 1길 30(우 04620))<br>&nbsp;&nbsp;&nbsp;Copyright ⓒ 2018 BY DONGGUK UNIVERSITY ALL RIGHTS RESERVED.</font></div>

</body>
</html>