<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.sql.*,java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="default_menu.css">
</head>
<body>
		<%
		Connection conn = null;
		Statement stmt = null;
		Statement stmt1=null;
		ResultSet rs = null;
		String sql = null;
		String jdbcurl=null;
		String time;
		int month,day,seat_num;
		
		try{	
		Class.forName("com.mysql.jdbc.Driver");
		jdbcurl = "jdbc:mysql://localhost:3306/project_db?useUnicode=true&characterEncoding=utf8";
		conn = DriverManager.getConnection(jdbcurl, "root", "1223");
		stmt = conn.createStatement();
		sql= "select * from seat_tbl";
		rs= stmt.executeQuery(sql);
		}
		catch(Exception e) {
		out.println("DB 연동오류입니다. : " + e.getMessage() );
		}
		
		while (rs.next()) {
			boolean after=false;
			seat_num=Integer.parseInt(rs.getString("seat_num"));
			if(Integer.parseInt(rs.getString("state"))==1){
			time=rs.getString("ts");
			month=Integer.parseInt(time.substring(5,7));
			day=Integer.parseInt(time.substring(8,10));
			Calendar cal=Calendar.getInstance();
			
			if(day==28){
				if(month==2){
					if(cal.get(Calendar.MONTH)>month){
						after=true;}
				}
				else{
					if(day>cal.get(Calendar.DATE)){
						after=true;
					}
				}
			}
			else if(day==30){
				if(month==4||month==6||month==9||month==11){
					if(cal.get(Calendar.MONTH)>month){
						after=true;}
				}else{
					if(day>cal.get(Calendar.DATE)){
						after=true;
					}
				}
			}
			else if(day==31){
				if(month==1||month==3||month==5||month==7||month==8||month==10||month==12){
					if(cal.get(Calendar.MONTH)>month){
						after=true;}
				}else{
					if(day>cal.get(Calendar.DATE)){
						after=true;
					}
				}
			}
			else{
				if(day>cal.get(Calendar.DATE)){
					after=true;
				}
			}
		if(after==true){
			stmt1 = conn.createStatement();
			String out_sql= "update seat_tbl set state=0,name="+"'"+"'"+"where seat_num="+seat_num;
			stmt1.executeUpdate(out_sql);
		}
			}
			}
%>
	
</body>
</html>