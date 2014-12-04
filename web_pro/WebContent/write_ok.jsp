<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"
		import="org.apache.commons.lang3.StringUtils"%>
<%
	Connection conn = null;
	PreparedStatement stmt =null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("INSERT INTO board(title, content)" +  "VALUES(?,?)");
		
		stmt.setString(2, title);
		stmt.setString(4, content);

		stmt.execute();
			
		} catch(SQLException e) {
		out.println( e.toString() );
		}  finally {
			if (rs != null) try{rs.close();} catch(SQLException e){}
			if (stmt != null) try{stmt.close();} catch(SQLException e){}
			if (conn != null) try{conn.close();} catch(SQLException e){}
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성완료</title>
<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>
</head>
<body>
	<div id="wrap">
		<div id="top">
			<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
	
		</div>
		<div id="bottom">
		<jsp:include page="share/footer.jsp" />
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	self.window.alert("작성완료");
	location.href="list.jsp";
</script>