<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>뒷담까는 사람들의 대화~ 뒷담화</title>
<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
					<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="content" style="height:520px;">
				<div class="container">

					<div class="alert">
						<b>${name }</b>님 등록해주셔서 감사합니다.
					</div>
					<div class="form-action">
						<form id="formToMain" action="pageServlet">
							<input type="submit" id="goToMain" class="btn" value="토론하러가기">
						</form>
					</div>
				</div>
			</div>
		</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>