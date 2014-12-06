<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<%
	Connection conn = null;
	Statement stmt =null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014?useUnicode=true&characterEncoding=utf8";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같은 키워드 글목록</title>
<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<link href="stylesheets/list.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.createStatement();
		String keyword = request.getParameter("keyword");
		
		String sqlList = "SELECT * FROM posts WHERE keyword='" + keyword + "' ORDER BY post_id DESC";
		rs = stmt.executeQuery(sqlList);		
%>
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
					<span class="head2text">"<%=keyword %>" 관련 게시물모음<br></span>
				</h2>
			</div>
			<div id="content_list">
				<div id="posts">
					<div id="post_list">
					<% 		
						while(rs.next()) {
							int post_id = rs.getInt(1);
							String title = rs.getString(2);
							String writer = rs.getString(3);
							String content = rs.getString(4);
							String created_at = rs.getString(5);
							int count = rs.getInt(6);
							int post_like = rs.getInt(7);
							int post_dislike = rs.getInt(8);
					%>
						<table id="post">
							<tr class="title">
								<td>제목 : <%=title %></td>
							</tr>
							<tr>
								<td><img src="images/charactor.png" width='150px'height='150px'></td>
									<td>	
								    <textarea name="content" rows="8" cols="70" readonly="readonly" style="resize:none"><%=content %></textarea><br>
								    작성시간 : <%=created_at %>
								    <input type="button" id="goModify" class="btn" value="수정" OnClick="location='modify.jsp?post_id=<%=post_id%>'">
								    <input type="button" id="goDelete" class="btn" value="삭제" OnClick="location='delete.jsp?post_id=<%=post_id%>'">
								    <input type="button" id="goComment" class="btn" value="댓글" OnClick="location='show.jsp?post_id=<%=post_id%>'">
								    <input type="button" id="goLike" class="btn" value="좋아요" 
								    	OnClick="location='like.jsp?post_id=<%=post_id%>&post_like=<%=post_like%>'">
								    <%=post_like %>
								    <input type="button" id="goDislike" class="btn" value="싫어요" 
								   	 OnClick="location='dislike.jsp?post_id=<%=post_id%>&post_dislike=<%=post_dislike%>'">
								    <%=post_dislike %>
								  </td>
							</tr>
								<hr style="width: 750px;"></hr>
							<tr>
								<td>작성자 : <%=writer %></td>
							</tr>
						</table>
						<% 
						} 
					%>
					</div>
					<%
					} catch(SQLException e) {
						out.println(e.getMessage());
				} finally {
						if (rs != null) try{rs.close();} catch(SQLException e){}
						if (stmt != null) try{stmt.close();} catch(SQLException e){}
						if (conn != null) try{conn.close();} catch(SQLException e){}
				}
				%>
				</div>
				<div id="button">
					<input type="button" id="goWrite" class="btn" value="작성하기"
						OnClick="location='write.jsp'"> <input type="button"
						id="goIndex" class="btn" value="이전 페이지로"
						OnClick="location='index.jsp'">
				</div>
			</div>
	</div>
			<div id="bottom">
				<jsp:include page="share/footer.jsp" />
			</div>
		</div>
</body>
</html>