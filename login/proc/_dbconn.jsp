<%@ 
	page contentType="text/html;charset=utf-8"
	import= "java.sql.*"
%>
<%
	String dbName = "haebi";
	String ID = "haebi";
	String PASS = "1234";
	
	Class.forName("org.gjt.mm.mysql.Driver").newInstance();
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/haebi?user=haebi&password=1234&useUnicode=true&characterEncoding=utf-8");
	stmt = conn.createStatement();
%>