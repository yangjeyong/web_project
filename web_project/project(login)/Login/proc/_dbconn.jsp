<%@ page language="java" contentType="text/html; Charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String dbUrl = "jdbc:mysql://localhost:3306/board60112387";
	String dbUser = "60112387";
	String dbPassword = "tae1017";
	
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/haebi?user=haebi&password=1234&useUnicode=true&characterEncoding=utf-8");
	stmt = conn.createStatement();
%>