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
	String writer = (String)session.getAttribute("inputid");
	String content = request.getParameter("content");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("INSERT INTO posts(title, writer, content)" +  "VALUES(?,?,?)");
		
		stmt.setString(1, title);
		stmt.setString(2, writer);
		stmt.setString(3, content);

		stmt.execute();
			
		} catch(SQLException e) {
		out.println( e.toString() );
		}  finally {
			if (rs != null) try{rs.close();} catch(SQLException e){}
			if (stmt != null) try{stmt.close();} catch(SQLException e){}
			if (conn != null) try{conn.close();} catch(SQLException e){}
		}
%>
<script type="text/javascript">
	self.window.alert("작성완료");
	location.href="list.jsp";
</script>