<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form name="fileForm" method='post' enctype ='multipart/form-data' 
  	action='Project_Server.jsp'>
	<p> <input type="file" name="inFile" class="inpt" placeholder="InFile" maxlength="20" >
	<p> <input type="text" name="outFile" class="inpt" placeholder="OutFile Name" maxlength="20">
	
<p> <select name="algo">
	<option value="">-----Select------</option>
	<option value="1">반전처리</option>
	<option value="2">밝게하기</option>
	<option value="3">어둡게하기</option>
	<option value="4">흑백처리</option>
	<option value="5">확대하기</option>
	<option value="6">축소하기</option>
	<option value="7">회전하기</option>
	<option value="8">엠보싱</option>
	<option value="9">블러링</option>
</select>
<p> <input type="text" name="parameter" class="inpt" placeholder="Parameter" maxlength="20">
<p> <input type="submit" value="Enter">
</form>

</body>
</html>