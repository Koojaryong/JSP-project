<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>

<%
	Connection conn = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/shop_db";
	String user = "root";
	String password = "1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	
	conn = DriverManager.getConnection(url,user,password);
	

%>	
