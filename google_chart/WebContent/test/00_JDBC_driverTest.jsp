<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con = null;
	try{
		String url = "jdbc:mysql://localhost:3306/book_ex";
		String uid = "user1";
		String pwd = "user1";
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver);
		con = DriverManager.getConnection(url, uid, pwd);
		out.println("제대로 연결되었습니다.");
	}catch(Exception e){
		e.printStackTrace();
		out.println("연결에 실패하였습니다.");
	}
%>
</body>
</html>