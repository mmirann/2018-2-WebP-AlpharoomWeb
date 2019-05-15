<%@ page import="file.fileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>JSP 파일 업로드</title>
</head>
<body>
	<%
	 String directory=application.getRealPath("/upload/");
	 int maxSize=1024*1024*100; //5MB
	 String enc="utf-8";
	 DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy(); 
	 
	 MultipartRequest multi=new MultipartRequest(request,directory, maxSize,enc,dfr);
	 
	 String fileName=multi.getOriginalFileName("file");
	 String fileRealName=multi.getFilesystemName("file");
	 
	 session.setAttribute("sessionFileRealName",fileRealName);
	 
	 new fileDAO().upload(fileName,fileRealName);
	 
	 //System.out.println("OK");
	%>
	</body>
</html>