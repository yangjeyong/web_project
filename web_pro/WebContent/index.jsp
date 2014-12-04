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
	
	int rank = 1;
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>뒷담화 메인</title>
<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<link href="stylesheets/index.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="add_keyword_form">
				<input type="text"  name="add_keyword" id="add_bar" placeholder="  토론하고 싶은 키워드를 추가하세요!">
				<input type="button" value="추가" id="add_button">
			</div>
			<div id="rankbox">
				<table id="top10_keyword">
				<% 		
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
					stmt = conn.createStatement();
					
					rs = stmt.executeQuery("SELECT * FROM keyword ORDER BY count DESC LIMIT 10");
					
					while(rs.next()) {
						String keyword = rs.getString(2);
					%>
						<tr class="keyword"><td><%out.println(rank + ". " + keyword);%></td></tr>
					<% 
					rank++;
					}
				} catch (SQLException e) {
					out.println(e.getMessage());
				} finally {
					if(rs != null) try{rs.close();} catch(SQLException e){}
					if(stmt != null) try{stmt.close();} catch(SQLException e){}
					if(conn != null) try{conn.close();} catch(SQLException e){}
				}
				%>
				</table>
			</div>
			<div id="enter_button">
						<a href="list.jsp" class="btn btn-mini">입장하기</a>
				</div>
		</div>
		<div id="bottom">
			<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>