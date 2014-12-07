<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	Statement stmt2 = null;
	ResultSet rs2 = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014?useUnicode=true&characterEncoding=utf8";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	String title ="";
	String name = "";
	String content = "";
	
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.createStatement();

		String sql = "SELECT title, writer, content FROM posts WHERE post_id=" + post_id;
		rs = stmt.executeQuery(sql);

		if(rs.next()){
			title = rs.getString(1);
			name = rs.getString(2);
			content = rs.getString(3);
		}
		sql = "SELECT id, user_ids, content FROM reply WHERE post_ids =" + post_id;
		rs2 = stmt.executeQuery(sql);


%>


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
			<div id="content_top">
				<h1>
					<span class="headtext">우리만의 뒷담화<br></span>
				</h1>
				<h2>
					<span class="head2text">상세한 뒷담화<br></span>
				</h2>
			</div>
			<form id="form" method=post action="show_ok.jsp?post_id=<%=post_id%>">
				<div id="content_show">
					<div class="control-group">
						<label class="control-label" for="title">제목</label>
						<div class="controls">
							<input id="title" class="inputbox" type="text" readonly="readonly"  name="title" value="<%=title%>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="keyword">작성자</label>
						<div class="controls">
							<input id="keyword" class="inputbox" type="text" readonly="readonly"  name="writer" value="<%=name%>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="content">내용</label>
						<div class="controls">
							<textarea name="content" rows="8" cols="70" readonly="readonly" style="resize:none"><%=content%></textarea><br>
						</div>
					</div>
				</div>
				<div id = "content_reply">
					<div class="control-group">
						<label class="control-label" for="content" style=" font-size: 20pt;">추가의견</label><br>
							<% while(rs2.next()) {
											int rep_id = rs2.getInt(1);
											String user_id = rs2.getString(2);
											String rep_contents = rs2.getString(3);
							%>
						<label class="control-label" for="content">작성자</label>
						<input id="reply" class="inputbox" type="text" readonly="readonly"  name="title" value="<%=user_id%>">
						<textarea name="reply_content" rows="2" cols="70" readonly="readonly" style="resize:none" ><%=rep_contents %></textarea>
						<input type="button" id="goDelete" class="btn" value="삭제" OnClick="location='rep_delete.jsp?rep_id=<%=rep_id%>&post_id=<%=post_id%>'">
						<br>
						<hr style="width: 750px;"></hr>
							<%} %>						
					</div>
				</div>
				<div id = "content_coment">
					<textarea id = "rep_cont" name="rep_cont" cols="70" rows="2" style="resize:none" ></textarea>
					<input type="submit" id="submit" value = "댓글 등록">
				</div>
			<% 	} catch(SQLException e) {
			out.println( e.toString() );
			} finally {
				if (rs != null) try{rs.close();} catch(SQLException e){}
				if (stmt != null) try{stmt.close();} catch(SQLException e){}
				if (rs2 != null) try{rs.close();} catch(SQLException e){}
				if (stmt2 != null) try{stmt.close();} catch(SQLException e){}
				if (conn != null) try{conn.close();} catch(SQLException e){}
				
			}%>
			</form>
			<input type="button" id="btns" value="목록으로" OnClick="location='list.jsp'">
		</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>