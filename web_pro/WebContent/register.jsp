<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"%>
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pass = request.getParameter("password");
	String passfirm = request.getParameter("password_confirm");
	String photo = request.getParameter("file") ;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("INSERT INTO users(id, name, pass, photo)" +	"VALUES(?, ?, ?, ?)");
			
		stmt.setString(1, id);
		stmt.setString(2, name);
		stmt.setString(3, pass);
		stmt.setString(4, photo);
			
		stmt.executeUpdate();
		
	} catch (SQLException e) {
			out.println(e.getMessage());
	} finally {
		if(rs != null) try{rs.close();} catch(SQLException e){}
		if(stmt != null) try{stmt.close();} catch(SQLException e){}
		if(conn != null) try{conn.close();} catch(SQLException e){}
	}

%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>뒷담까는 사람들의 대화~ 뒷담화</title>
<link href="stylesheets/main.css" rel="stylesheet" type="text/css">
<script src='http://code.jquery.com/jquery-latest.js'></script>

</head>
<body>
	<div id="wrap">
		<div id="top">
					<jsp:include page="share/header.jsp" />
		</div>
		<div id="middle">
			<div id="content" style="height:520px;">
				<div class="container">

					<div class="alert">
						<b><% out.println(name); %></b>님 등록해주셔서 감사합니다.
					</div>
					<div class="form-action">
						<form id="formToLogin" action="main.jsp">
							<input type="submit" id="goToLogin" class="btn" value="로그인하러가기">
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
</html>