<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form name='fileForm' method='post' enctype='multipart/form-data'
   action='Photo_Server.jsp'>
   <p> <select name="algo">
		<option value=""> ---SELECT---</option>
		<option value="1">반전처리</option>
		<option value="2">밝게하기</option>	
		<option value="3">어둡게하기</option>
		<option value="4">흑백</option>	
	</select>
	<p> <input type="file" name="inFile" class="inpt" placeholder="InFile" maxlength="20" >
	<p><input type="text" name="parameter" class="inpt" placeholder="Parameter" maxlength="20">	
	<p> <input type="submit" value="Enter">
   
</form>

</body>
</html>