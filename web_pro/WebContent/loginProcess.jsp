<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.util.*" import="java.sql.*"
		import="org.apache.commons.lang3.StringUtils"
		import="com.oreilly.servlet.MultipartRequest"
		import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
	
<%
	String uploadPath = request.getRealPath("images");
	int size = 10 * 1024 * 1024;

	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
    new DefaultFileRenamePolicy());

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/web2014?useUnicode=true&characterEncoding=utf8";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	request.setCharacterEncoding("UTF-8");
	
	String id = multi.getParameter("inputid");
	String pass = multi.getParameter("inputpwd");


	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		
		stmt = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
		
		stmt.setString(1, id);
		rs = stmt.executeQuery();

		if (rs.next()) {
			if(pass.equals(rs.getString("pass"))){
				session.setAttribute("inputid", id);
				
				out.println("<script>");
				out.println("location.href='index.jsp'");
				out.println("</script>");
			}
		} 
		
	} catch (SQLException e) {
			out.println(e.getMessage());
	} finally {
		if(rs != null) try{rs.close();} catch(SQLException e){}
		if(stmt != null) try{stmt.close();} catch(SQLException e){}
		if(conn != null) try{conn.close();} catch(SQLException e){}
	}

%>

