<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"%>
		
<script language = "javascript">  // 자바 스크립트 시작
function modifyCheck()
  {
   var form = document.modifyform;
   
   if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.password.focus();
    return;
   }

  if( !form.content.value )
   {
    alert( "내용을 적어주세요" );
    form.content.focus();
    return;
   }  
 		form.submit();
  } 
</script>

<%
	Connection conn = null;
	Statement stmt =null;
	ResultSet rs = null;	
	
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014?useUnicode=true&characterEncoding=utf8";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	String userid = (String)session.getAttribute("inputid");
	String title = "";
	String content = "";
	String writer = "";
	
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	
	
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.createStatement();

		String sql = "SELECT title, writer, content FROM posts WHERE post_id=" + post_id;
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			title = rs.getString(1);
			writer = rs.getString(2);
			content = rs.getString(3);
			if(userid.equals(writer)){}
			else{%>
			<script type="text/javascript">
			window.alert("자신의 글만 수정할 수 있습니다.");
			location.href="list.jsp";
			</script>
<%		}
		}

	} catch(SQLException e) {
		out.println( e.toString() );
} finally {
		if (rs != null) try{rs.close();} catch(SQLException e){}
		if (stmt != null) try{stmt.close();} catch(SQLException e){}
		if (conn != null) try{conn.close();} catch(SQLException e){}
}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
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
		<form id="form" method=post action="modify_ok.jsp?post_id=<%=post_id%>">
				<div class="control-group">
					<label class="control-label" for="title">제목수정</label>
					<div class="controls">
						<input id="title" class="inputbox" type="text" placeholder="제목" name="title" value="<%=title%>">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="keyword">키워드수정</label>
					<div class="controls">
						<input id="keyword" class="inputbox" type="text" placeholder="키워드" name="keyword">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="content">내용</label>
					<div class="controls">
						<textarea id="content" name="content" cols="15" rows="20" ><%=content%></textarea>
					</div>
				</div>
		</form>
		
			<input type="button" id="btn" class="btn" value="수정" OnClick="window.location='modify_ok.jsp?post_id=<%=post_id%>'">
			<input type="button" id="btn" value="취소" OnClick="location='list.jsp'">
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