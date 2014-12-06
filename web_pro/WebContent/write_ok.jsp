<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"
		import="org.apache.commons.lang3.StringUtils"%>
<%
	Connection conn = null;
	Statement stmt1 = null;
	PreparedStatement stmt2 = null;
	PreparedStatement stmt3 = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014?useUnicode=true&characterEncoding=utf8";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	String writer = (String)session.getAttribute("inputid");
	String content = request.getParameter("content");
	int count = 0;
	int post_like = 0;
	int post_dislike = 0;
	
	String input_keyword = request.getParameter("keyword");
	String keyword = "";
	int keyword_count = 0;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		
		stmt1 = conn.createStatement();
		rs = stmt1.executeQuery("SELECT * FROM keyword WHERE keyword='" + input_keyword + "'");
		
		if(rs.next()){
			keyword = rs.getString(2);
			keyword_count = rs.getInt(3);
		}
		if(keyword.equals(input_keyword)){
			keyword_count++;
			stmt2 = conn.prepareStatement("UPDATE keyword SET count='" + keyword_count +"' WHERE keyword='" + input_keyword + "'");
			stmt2.executeUpdate();
			
			stmt3 = conn.prepareStatement("INSERT INTO posts(title, writer, content, count, post_like, post_dislike, keyword)"
					+  "VALUES(?,?,?,?,?,?,?)");
				
				stmt3.setString(1, title);
				stmt3.setString(2, writer);
				stmt3.setString(3, content);
				stmt3.setInt(4, count);
				stmt3.setInt(5, post_like);
				stmt3.setInt(6, post_dislike);
				stmt3.setString(7, keyword);

				stmt3.execute();
		} else {
			keyword_count = 1;
			stmt2 = conn.prepareStatement("INSERT INTO keyword(keyword, count)" +  "VALUES(?,?)");
			
			stmt2.setString(1, input_keyword);
			stmt2.setInt(2, keyword_count);
	
			stmt2.execute();
			
			stmt3 = conn.prepareStatement("INSERT INTO posts(title, writer, content, count, post_like, post_dislike, keyword)"
					+  "VALUES(?,?,?,?,?,?,?)");
				
				stmt3.setString(1, title);
				stmt3.setString(2, writer);
				stmt3.setString(3, content);
				stmt3.setInt(4, count);
				stmt3.setInt(5, post_like);
				stmt3.setInt(6, post_dislike);
				stmt3.setString(7, input_keyword);

				stmt3.execute();
		}
		} catch(SQLException e) {
		out.println( e.toString() );
		}  finally {
			if (rs != null) try{rs.close();} catch(SQLException e){}
			if (stmt1 != null) try{stmt1.close();} catch(SQLException e){}
			if (stmt2 != null) try{stmt2.close();} catch(SQLException e){}
			if (conn != null) try{conn.close();} catch(SQLException e){}
		}
%>
<script type="text/javascript">
	self.window.alert("작성완료");
	location.href="list.jsp";
</script>