<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="proc/_session.jsp" %>

<html>
	<head>
		<title>jdbc Login 예제</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>
<body>
<h2>로그인</h2>
<br>
<br>
<%
	if(uid != null){ //session 체크
%>
<%=uname %>님 환영합니다.<p>
<a href="proc/logout.jsp">로그아웃</a>
<%
//session 체크(끝)
	}else{ // session 이 없는경우
%>
<table>
	<form name="login" method="post" action="proc/login_proc.jsp">
		<tr>
			<td align="center" colspan="2"><h4>로그인</h4></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="userid"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2"><div align="right">
				<input type="button" value="로그인" onclick="javascript:document.login.submit()">
				<input type="button" value="회원가입" onclick="javascript:document.location='register.jsp'"">
			</div></td>
		</tr>
	</form>
</table>
<%
	}// session 이 없는경우 (끝)
%>

</body>
</html>