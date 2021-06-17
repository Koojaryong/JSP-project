<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>
	<% 
	String mem_id=request.getParameter("mem_id");
	String mem_name=request.getParameter("mem_name");
	String mem_pass=request.getParameter("mem_pass");
	String mem_passc=request.getParameter("mem_passc");
	String mem_birth=request.getParameter("mem_birth");
	String mem_email=request.getParameter("mem_email");
	
	
	Statement stmt = conn.createStatement(); //쿼리명령문.
	String sql = "INSERT INTO member(mem_id,mem_name,mem_pass,mem_passc,mem_birth,mem_email)";
	sql += "VALUES ('" + mem_id + "','" + mem_name + "','" + mem_pass +"','"+mem_passc+"','"+mem_birth+"','"+mem_email+"')";
	stmt.executeUpdate(sql);
	
	stmt.close();	
	conn.close();
	out.println("입력성공!");
	
	%>
	<form method = "post" action="Session_Client.jsp">
	<p> <input type = "submit" value="로그인창 이동">
</body>
</html>