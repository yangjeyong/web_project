<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
		<form id="form" method=post action="write_ok.jsp">
				<div class="control-group">
					<label class="control-label" for="title">제목</label>
					<div class="controls">
						<input id="title" class="inputbox" type="text" placeholder="제목" name="title">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="content">내용</label>
					<div class="controls">
						<textarea id="content" name="content" cols="30" rows="13"></textarea>
					</div>
				</div>
		</form>
		<form id="wirteButton" action="write_ok.jsp">
			<input type="button" id="btn" value="등록">
		</form>
		<form id="cancleButton" action="list.jsp">
			<input type="button" id="btn" value="취소">
		</form>
		</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
<script type="text/javascript">
	$("#btn").click(function() {
		if($("#title").val() == "") {
			alert("제목을 입력해주십시오");
		} else if($("#content").val() == "") {
			alert("내용을 입력해주십시오");
		} else {
			$("#form").submit();
		}
	});
</script>
</html>