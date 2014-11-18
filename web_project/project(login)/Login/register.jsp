<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="proc/_session.jsp"%>

<html>
<head>
<title>회원가입</title>

</head>
<body>
	<center>
		<h2>회원가입</h2>
		<br> <br>
		<%
			if (uid != null) { //session 체크
		%>
		<%
			response.sendRedirect("index.jsp"); // 리다이렉션 페이지
		%>
		<%
			//session 체크(끝)
			} else { // session 이 없는경우
		%>
		<table>
			<form name="register" method="post" action="proc/reg_proc.jsp">
				<tr>
					<td align="center" colspan="2"><h4>회원가입</h4></td>
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
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td colspan="2"><div align="right">
							<input type="button" value="메인으로"
								onclick="javascript:document.location='index.jsp'"> <input
								type="button" value="가입신청"
								onclick="javascript:document.register.submit()">
						</div></td>
				</tr>
			</form>
		</table>
		<%
	}// session 이 없는경우 (끝)
%>
	</center>
</body>
</html>