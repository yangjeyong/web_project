<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"
		import="org.apache.commons.lang3.StringUtils"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014?useUnicode=true&characterEncoding=utf8";
	String dbUser = "web";
	String dbPassword = "asdf";	
	
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.createStatement();

		String sql = "SELECT post_id, title, writer, content, created_at FROM posts WHERE post_id=" + post_id;
		rs = stmt.executeQuery(sql);

		if(rs.next()){
			String title = rs.getString(2);
			String writer = rs.getString(3);
			String content = rs.getString(4);
			String created_at = rs.getString(5);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 정보</title>
<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<table>
				<tr>
					<td>글번호</td>
					<td><%=post_id%></td>
				</tr>
				<tr height="1" bgcolor="#fff"><td colspan="4" width="400"></td></tr>
				<tr>
					<td>제목</td>
					<td><%=title%></td>
				</tr>
				<tr height="1" bgcolor="#fff"><td colspan="4" width="400"></td></tr>
				<tr>
					<td>작성자</td>
					<td><%=writer%></td>
				</tr>
				<tr height="1" bgcolor="#fff"><td colspan="4" width="400"></td></tr>
				<tr>
					<td>작성일</td>
					<td><%=created_at%></td>
				</tr>
				<tr height="1" bgcolor="#fff"><td colspan="4" width="400"></td></tr>
		    <tr>
		   	 <td width="400" colspan="2" height="200"><%=content%></td>
		    </tr>
		<%
				}
			} catch(SQLException e) {
				out.println( e.toString() );
				} finally {
					if (rs != null) try{rs.close();} catch(SQLException e){}
					if (stmt != null) try{stmt.close();} catch(SQLException e){}
					if (conn != null) try{conn.close();} catch(SQLException e){}
				}
		%>
				<tr height="1" bgcolor="#fff"><td colspan="4" width="400"></td></tr>
				<tr align="center">
					<td colspan="2" width="400">
						<input type=button value="목록" OnClick="window.location='list.jsp'">
						<input type=button value="수정" >
						<input type=button value="삭제" >
					</td>
				</tr>
			</table>
		</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>