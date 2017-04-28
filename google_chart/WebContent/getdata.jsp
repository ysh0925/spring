<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/book_ex";
	String uid = "user1";
	String pwd = "user1";
	String driver = "com.mysql.jdbc.Driver";
	try{
		Class.forName(driver).newInstance();
		con = DriverManager.getConnection(url,uid,pwd);
		
		ResultSet rs = null;
		List empdetails = new LinkedList();
		JSONObject responseObj = new JSONObject();
		String query = "select id, name from employee";
		PreparedStatement pstmt = con.prepareStatement(query);
		
		rs = pstmt.executeQuery();
		JSONObject empObj = null;
		
		while (rs.next()){
			String name = rs.getString("name");
			int empid = rs.getInt("id");
			empObj = new JSONObject();
			empObj.put("name",name);
			empObj.put("empid",empid);
			empdetails.add(empObj);
		}
		responseObj.put("empdetails", empdetails);
		out.print(responseObj.toString());
	}catch(Exception e){
		e.printStackTrace();
	}
%>