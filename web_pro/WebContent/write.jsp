<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"%>
<%
	Connection conn = null;
	Statement stmt =null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014?useUnicode=true&characterEncoding=utf8";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	request.setCharacterEncoding("utf-8");
	String keyword = request.getParameter("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<link href="stylesheets/write.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id = "content_top">
				<h1><span class="headtext">우리만의 뒷담화 </span></h1>
				<h2><span class="head2text">의견을 적어주세요 </span></h2>
			</div>
		<div id = "content_center">
		<%
		if(keyword != null){
		%>
			<form id="form" method=post action="write_ok.jsp?keyword=<%=keyword%>">
					<div class="control-group">
						<label class="control-label" for="title">제목</label>
						<div class="controls">
							<input id="title" class="inputbox" type="text" placeholder="제목" name="title">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="keyword">키워드</label>
						<div class="controls">
							<textarea cols="23" rows="1" readonly="readonly" style="resize:none"><%=keyword %></textarea>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="content">내용</label>
						<div class="controls">
							<textarea id="content" name="content" cols="15" rows="20"></textarea>
						</div>
					</div>
			</form>
		<% 
		} else {
		%>
			<form id="form" method=post action="write_ok.jsp">
			<div class="control-group">
				<label class="control-label" for="title">제목</label>
				<div class="controls">
					<input id="title" class="inputbox" type="text" placeholder="제목" name="title">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="keyword">키워드</label>
				<div class="controls">
					<input id="keyword" class="inputbox" type="text" placeholder="키워드" name="keyword">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="content">내용</label>
				<div class="controls">
					<textarea id="content" name="content" cols="15" rows="20"></textarea>
				</div>
			</div>
		</form>
		<%
		}
		%>
			<input type="button" id="btn" value="등록">
			<input type="button" id="btn" value="취소" OnClick="javascript:history.back()">
		</div>
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