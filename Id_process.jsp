<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
   String mem_pass = request.getParameter("mem_pass");
   String mem_birth = request.getParameter("mem_birth");

   
   ResultSet rs = null;
   Statement stmt = conn.createStatement();
   
   String sql = "SELECT mem_id FROM member WHERE mem_pass='";
   sql += mem_pass + "' AND mem_birth='" + mem_birth +"';";
   
   
   //out.println(sql);
   rs =stmt.executeQuery(sql);
   
   String mem_id="";
   
   if(rs.next()) {
      mem_id = rs.getString("mem_id");
      out.println("아이디 : " + mem_id );
   }else{
      out.println("잘못입력하셨습니다.");
   }
      
   stmt.close();
   conn.close();            
%>
<form method="post" action="Session_Client.jsp">
		<p><input type="submit" value="BACK">
</form>


</body>
</html>