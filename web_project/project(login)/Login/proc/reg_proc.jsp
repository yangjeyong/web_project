<%@ 
	page contentType="text/html;charset=utf-8"
	import= "java.sql.*"
%>
<%@ include file="_dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("userid");
	String upass = request.getParameter("passwd");
	String uname = request.getParameter("name");
	String uemail = request.getParameter("email");
	
	String	no 			= "",
			userid		= "",
			name		= "",
			email		= "",
			cert_email	= "";
	
	try{
		String strSQL = "insert into member values(NULL,'"+uid+"',PASSWORD('"+upass+"'),'"+uname+"','"+uemail+"','N',CURRENT_TIMESTAMP)";
		//String strSQL = "insert into member values(NULL,'user10','1234','유저1','wwww','N',CURRENT_TIMESTAMP)";
		
		//stmt = conn.prepareStatement(strSQL);
		stmt.executeUpdate(strSQL);
		
		stmt.close();
		conn.close();

		response.sendRedirect("../index.jsp");	// 리다이렉션 페이지
		}
	catch(SQLException se){
		out.println("Error : "+se.getMessage());
	}			
%>