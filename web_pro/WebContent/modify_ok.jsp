<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"
		import="org.apache.commons.lang3.StringUtils"%>

<%
	Connection conn = null;
	Statement stmt =null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014?useUnicode=true&characterEncoding=utf8";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String writer = (String)session.getAttribute("inputid");
	String content = request.getParameter("content");
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	
	try{		
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.createStatement();
		
		String sql = "SELECT * FROM posts WHERE post_id=" + post_id;
		rs = stmt.executeQuery(sql);
//		stmt.executeUpdate("DELETE FROM posts WHERE post_id=" + post_id);    
		sql = "UPDATE posts SET title='" + title+ "' ,content='"+ content+ "' ,writer='"+ writer +"' WHERE post_id= '" + post_id+"'";				
		stmt.executeUpdate(sql);	
	%>
	<script language=javascript>
			self.window.alert("수정 완료");
			location.href="list.jsp";
	</script>
	<%	 
	} catch(SQLException e) {
			out.println( e.toString() );
	} finally {
		if (rs != null) try{rs.close();} catch(SQLException e){}
		if (stmt != null) try{stmt.close();} catch(SQLException e){}
		if (conn != null) try{conn.close();} catch(SQLException e){}
	}
	%>
	
