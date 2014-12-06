<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"
		import="org.apache.commons.lang3.StringUtils"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	String writer = null;
	int post_id = Integer.parseInt(request.getParameter("post_id"));
	String inputid = (String)session.getAttribute("inputid");
	
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.createStatement();

		rs = stmt.executeQuery("SELECT writer FROM posts WHERE post_id=" + post_id);

		if(rs.next()){
			writer = rs.getString(1);
		}
		
		if(writer.equals(inputid)) {
   			
			stmt.executeUpdate("DELETE FROM posts WHERE post_id=" + post_id);	 
%>
<script language=javascript>
			self.window.alert("삭제 완료");
			location.href="list.jsp";
</script>
<%
		} else { 
%>
<script language=javascript>
			self.window.alert("본인이 작성한 글이 아닙니다.");
			location.href="javascript:history.back()";
</script>
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