<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int id = 0;

	try {
		id = Integer.parseInt(request.getParameter("id"));
	}catch(Exception e){}
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>뒷담까는 사람들의 대화~ 뒷담화</title>
<link href="stylesheets/loginPage.css" rel="stylesheet" type="text/css">
<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="content">
				<div id="content_border">
					<div id="logintitle">
						<span><b>뒷담화에 오신 것을 환영합니다.</b> </span><br>
					</div>
					<div class="container">
						
						<form id="form" class="form-horizontal" action="multiServlet" enctype="multipart/form-data" method="POST">
							<fieldset>
								<legend class="legend">회원 가입</legend>

									<div id="user_content">
										<div class="control-group">
											<label class="control-label" for="email">아이디</label>
												<div class="controls">
													<input id="id" class="inputbox" type="id" placeholder="아이디"
													name="id" value="${sessionScope.user.id }">
												</div>											
										</div>


									<div class="control-group">
										<label class="control-label" for="name">이름</label>
										<div class="controls">
											<input id="name" class="inputbox" type="text" placeholder="이름" 
											name="name" value="${sessionScope.user.name }">
										</div>
									</div>


									<div class="control-group">
										<label class="control-label" for="password">비밀번호</label>
										<div class="controls">
											<input id="password" class="inputbox" type="password" name="password">
										</div>
									</div>


									<div class="control-group">
										<label class="control-label" for="password_confirm">비밀번호 확인</label>
										<div class="controls">
											<input id="password-confirm" class="inputbox" type="password"	name="password_confirm">
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label" for="picture">프로필 사진</label>
										<div class="controls">
											<input class="file" id="fileInput" name="file" type="file">
										</div>
										
									</div>
								</div>
							</fieldset>

							<div class="form-actions">
								<input type="hidden" name="op" value="register">
								
									<% if(id<= 0) {%>
										<input id="btn" type="button" class="btn btn-primary" value="가입">
									<%}else{ %>
										<input id="btn" type="button" class="btn btn-primary" value="수정">
										<a href="#" class="btn btn-primary" data-action="delete" data-id="<%=id %>">탈퇴 </a>
									<%} %>
									<input id="cancel" type="button" class="btn" value="취소하기">
							</div>
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
<script type="text/javascript">
	$("#btn").click(function() {
		if($("#id").val() == "") {
			alert("id을 입력해주십시오");
		} else if($("#name").val() == "") {
			alert("이름을 입력해주십시오");
		} else if($("#password").val() == "") {
			alert("비밀번호를 입력해주십시오");
		} else if($("#password").val() != $("#password-confirm").val()) {
			alert("비밀번호가 일치하지 않습니다");
		} else if($("#fileInput").val() == null) {
			alert("프로필 사진을 선택해주십시오");
		} else {
			$("#form").submit();
		}
	});
	$("#cancel").click(function() {
		history.back();
	});

	$("a[data-action = 'delete']").click(function(){
		if(confirm("정말로 삭제 하시겠습니까?")){
			location = 'delete.jsp?id=' + $(this).attr('data-id');
			}
		return false;
	});
</script>
</html>