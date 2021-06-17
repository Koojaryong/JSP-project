<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>
	function send_go(){
	    if(document.f.mem_name.value == ""){
	        alert("이름을 입력하세요");
	        document.f.mem_name.focus();
	        return false;
	    }
	   
	    if(document.f.mem_id.value == ""){
	        alert("아이디를 입력하세요");
	        document.f.mem_id.focus();
	        return false;
	    } 
	   
	    if(document.f.mem_pass.value == ""){
	        alert("패스워드를 입력하세요");
	        document.f.mem_pass.focus();
	        return false;
	    } else if (document.f.mem_pass.value != document.f.mem_passc.value){
	        alert("암호가 일치하지 않습니다. 다시 입력하세요");
	        document.f.mem_pass.value = "";
	        document.f.mem_passc.value = "";
	        document.f.mem_pass.focus();
	        return false;
	        
	      
	    }
	}
	
</script>
<body>
<form name="f" method = "post" action="Register_process.jsp" onsubmit ="return send_go()" >
	<p><input type = "text" name = "mem_name" class="inpt" placeholder="Name" maxlength="20">
	<p><input type = "text" name = "mem_id" class="inpt" placeholder="Id" maxlength="20">	
	<p><input type = "text" name = "mem_pass" class="inpt" placeholder="Password" maxlength="20">
	<p><input type = "text" name = "mem_passc" class="inpt" placeholder="Password Check" maxlength="20">
	<p><input type = "text" name = "mem_birth" class="inpt" placeholder="Birth" maxlength="20">
	<p><input type = "email" name = "mem_email" class="inpt" placeholder="E-mail" maxlength="20">
	<p><input type = "checkbox" name = "mem_gender" value="Man"> Man
			<input type = "checkbox" name = "mem_gender" value="Women"> Women
	<p> <input type = "submit" value="Enter" >	
</form>
<form method = "post" action="Session_Client.jsp">
	<p> <input type = "submit" value="Go Login">
</form>
</body>
</html>