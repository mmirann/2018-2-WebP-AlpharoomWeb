<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: NanumGothic;
}
#login_button { 
background-color: white;
  color: #f19c01;
  border: 2px solid #f19c01;
}
#logout_button {
background-color: white;
  color: #f19c01;
  border: 2px solid #f19c01;
}</style>
<script>

function focusIt()
{
	document.inform.id.focus();
}

function checkIt()
{
	inputForm=eval("document.inform");
	if(!inputForm.id.value){
		alert("아이디를 입력하시오");
		inputForm.id.focus();
		return false;
	}
	if(!inputForm.passwd.value){
		alert("비밀번호를 입력하시오");
		inputForm.passwd.focus();
		return false;
	}
}


function b_function(){
	var button = document.getElementById('login_button');
	var div = document.getElementById('newpost');
    if (div.style.display !== 'none') {
    	button.type="submit";
    	 parent.document.location.reload(); 
    }
    else {
        div.style.display = 'inline';
    }
};


</script>
</head>
<body>
<%if(session.getAttribute("sessionId")==null){%>
<form name="inform" method="post" action="loginPro.jsp" onSubmit="return checkIt();">
<div style="display:none" id="newpost">
<input type="text" name="id" placeholder="id" size="7"/><input type="password" name="password" placeholder="password" size="7" /> 
</div>
<button type="button" id="login_button" onclick="b_function()">로그인</button></form>
<%} else{%>
<script>
(function(){
	var button = document.getElementById('login_button');
	var div = document.getElementById('newpost');
	div.style.display="none";
	button.style.display="none";
})();</script>
 <form method="post" action="logout.jsp">
<font size="2"><b>
<%=session.getAttribute("sessionName")%></b>님 안녕하세요 !&nbsp;</font>
 <input type="submit" id="logout_button" onclick="parent.document.location.reload()" style="width:60px; height: 20px; font-size: 10px ;" value="로그아웃"/>
 </form>
<%} %>

</body>
</html>