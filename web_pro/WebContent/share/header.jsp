<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	buffer="8kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src='./javascript/jquery-1.8.2.min.js'></script>
<div id="header">
	<div id="logo">
		<img src="./images/logo.png" width='300px' height='60px' OnClick="location='index.jsp'">
	</div>

	<c:choose>
		<c:when test="${sessionScope.inputid == null }">
			<div id="login">
				<form action="loginProcess.jsp" enctype="multipart/form-data" method="POST" >
					<ul>
						<li><span>아이디</span> <input type="text" name="inputid" id="inputid" value="${sessionScope.inputid}"></li>
						<li><span>비밀번호</span> <input type="password" name="inputpwd"></li>
						<li><input type="submit" id="login_button" value="로그인"></li>
					</ul>
					<input type="hidden" name="op" value="login">
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<div id="loginsuccess">
				<form method="post" action="logout.jsp">
					안녕하세요. <b>${sessionScope.inputid }</b> 님 반갑습니다.
					<input type="submit" id="logout_button" value="로그아웃">
				</form>
			</div>
		</c:otherwise>
	</c:choose>
	<div id="border"></div>
</div>
<script type="text/javascript">
	$("#logout_button").click(function() {
		location = logout.jsp;
	});
</script>