<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"
		import="org.apache.commons.lang3.StringUtils"%>
<%
	Connection conn = null;
	Statement stmt =null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	request.setCharacterEncoding("UTF-8");
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	int post_like = Integer.parseInt(request.getParameter("post_like"));
	post_like++;
	
	conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	stmt = conn.createStatement();
	
	rs = stmt.executeQuery("SELECT post_like FROM posts WHERE post_id=" + post_id);
	
	if(rs.next()){
		stmt.executeUpdate("UPDATE posts SET post_like='" + post_like + "' WHERE post_id=" + post_id); 
	}
%>
<script language=javascript>
		location.href="list.jsp";
</script>