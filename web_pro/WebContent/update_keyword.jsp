<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"
		import="org.apache.commons.lang3.StringUtils"%>
<%
	Connection conn = null;
	PreparedStatement stmt =null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014?useUnicode=true&characterEncoding=utf8";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	String input_keyword = request.getParameter("keyword");
	int count = 0;
	int id = 1;
	String keyword = "";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

			stmt = conn.prepareStatement("INSERT INTO keyword(keyword, count)" +  "VALUES(?,?)");
			
			stmt.setString(1, input_keyword);
			stmt.setInt(2, count);
	
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
	self.window.alert("등록완료");
	location.href="index.jsp";
</script>