<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"%>
<%
	Connection conn = null;
	Statement stmt =null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	request.setCharacterEncoding("utf-8");
	
	// 페이지 설정
	int pageNo = 1;

	try {
		pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex) {
	}

	int numInPage = 3; // 한페이지에 출력할 아이템 개수
	int startPos = (pageNo - 1) * numInPage; // 몇 번째 아이템 부터 이 페이지에?
	int numItems, numPages;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>토론 목록</title>
<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<link href="stylesheets/list.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
<%
	int total = 0;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.createStatement();

		rs = stmt.executeQuery("SELECT COUNT(*) FROM posts");
		rs.next();
		numItems = rs.getInt(1);
		numPages = (int) Math.ceil((double) numItems
				/ (double) numInPage);
		rs.close();
		stmt.close();

		// users 테이블 SELECT
		stmt = conn.createStatement();
		rs = stmt
				.executeQuery("SELECT * FROM posts ORDER BY post_id DESC LIMIT "
						+ startPos + ", " + numInPage);		
%>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="posts">
				<div id="post_top">
				<table id="post_top">
					<thead id="postnav">
						<tr id="post_nav">
							<th class="post_title">제목</th>
							<th class="post_writer">작성자</th>
							<th class="post_created_at">작성일</th>
							<th class="post_count">조회수</th>
						</tr>
					</thead>
					<tbody id="post_list">
					<%
						if(numItems==0) {
					%>
						<tr class="post_noinfo"><td>등록된 글이 없습니다.</td></tr>
					<%
				 		} else { 		
								while(rs.next()) {
									int post_id = rs.getInt(1);
									String title = rs.getString(2);
									String writer = rs.getString(3);								
									String created_at = rs.getString(5);
									int count = rs.getInt(6);
					%>
						<tr class="post_info">
							<td><%=title %></td>
							<td><%=writer %></td>
							<td><%=created_at %></td>
							<td><%=count %></td>
						</tr>
					<% 
								}
						} 
					%>			
					</tbody>
				</table>
				</div>
				<div id="wirte_button">
					<form id="formToMain" action="write.jsp">
							<input type="button" id="goWrite" class="btn" value="작성하기">
					</form>
				</div>
				<div id="post_bottom">
				<div class="page_nav">
					
					
				<%
					// 페이지 네비게이션을 위한 준비
					int startPageNo, endPageNo;
					int delta = 5;
					startPageNo = (pageNo <= delta) ? 1 : pageNo - delta;
					endPageNo = startPageNo + (delta * 2) + 1;
				
					if (endPageNo > numPages) {
						endPageNo = numPages;
					}
					// 이전 페이지로
					if (pageNo <= 1) {
				%>
						<a href="#">&laquo;</a>
					<%
					} else {
					%>
						<a href="list.jsp?page=<%=pageNo - 1%>">&laquo;</a>
					<%
					}
					// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
					for (int i = startPageNo; i <= endPageNo; i++) {
						out.println("<a href='list.jsp?page=" + i + "'>" + i + "</a>");
						out.println("");
					}
				
					// 다음 페이지로
					if (pageNo >= numPages) {
					%>
					<a href="#">&raquo;</a>
					<%
					} else {
					%>
					<a href="list.jsp?page=<%=pageNo + 1%>">&raquo;</a>
					<%
					}
					%>
					
					
				</div>
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
		</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>