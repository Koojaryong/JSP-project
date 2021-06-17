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
   String mem_name = request.getParameter("mem_name");
   String mem_pass = request.getParameter("mem_pass");
   
   
   Statement stmt = conn.createStatement();  // 쿼리 명령문
   // UPDATE member  SET  mem_name='kkkk', mem_pass='kkkk'  
   //      WHERE mem_id = 'cccc';
   String sql = "UPDATE member SET mem_pass='" + mem_pass  + "' ";
   sql += "WHERE mem_name = '" + mem_name + "'";
   stmt.executeUpdate(sql);

   stmt.close();
   conn.close();
   out.println("변경에 성공하셨습니다.");
   %>
<form method="post" action="Session_Client.jsp">
		<p><input type="submit" value="BACK">
</form>   

</body>
</html>