<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"
		import="org.apache.commons.lang3.StringUtils"%>

<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014?useUnicode=true&characterEncoding=utf8";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	request.setCharacterEncoding("UTF-8");
	String content = request.getParameter("rep_cont");
	String writer = (String)session.getAttribute("inputid");
	
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	
	try{		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("INSERT INTO reply(post_ids, content, user_ids)" +	"VALUES(?, ?, ?)");
			
		stmt.setInt(1, post_id);	
		stmt.setString(2, content);
		stmt.setString(3, writer);
		
		stmt.executeUpdate();
	%>
	<script language=javascript>
			self.window.alert("댓글 등록 완료");
			location.href="show.jsp?post_id=<%=post_id%>";
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
	
