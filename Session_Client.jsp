<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta http-equiv = "Content-type" content = "text/html"; charset="UTF-8">
<meta name = "viewport" content="width=device-width", inital-scale="1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login.css">
<style>
*{
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image: #34495e;
}

.title {
  position:relative;
  left:46%;
  font-size:30px;


}

.loginForm {
  position:absolute;
  width:300px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.loginForm h1{
  text-align: center;
  margin: 30px;
}

.idForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.passForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.submit {
  position:relative;
  left:50%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.submit:hover {
  background-position: right;
}

.regi {
  position:relative;
  left:48%;
  }

.bottomText {
  text-align: center;
}

</style>
</head>
<body width="100%" height="100%">
<form method="post" class="LoginForm" action="Session_Server.jsp">
	<div class="title">
	<h1>Login</h1>
	</div>
	<div class="idForm">
	<input type = "text" name = "mem_id" class="id" placeholder="Your ID" required>
	</div>
	<div class="passForm">
	<input type = "password" name = "mem_pass" class="pw" placeholder="Your password" required>
	</div>
	<div class="submit-wrap">
	 <input type = "submit" value="Sign in" class="submit">			
	</div>
</form>
	<div class="regi">
	  <a href="Register.jsp">REGISTER</a>
	</div><br>
     <div class="bottomText" >
        Don't you have ID? <a href="Id.jsp">sign up</a>
      </div><br>
      <div class="bottomText" >
        Don't you have PASSWORD? <a href="Password.jsp">sign up</a>
      </div>
      

</body>

</html>