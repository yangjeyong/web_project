<%@ 
	page contentType="text/html;charset=EUC-KR"
	import= "java.sql.*"
%>
<%@ include file="_dbconn.jsp" %>

<%
	String uid = request.getParameter("userid");
	String upass = request.getParameter("passwd");
	
	String	no 			= "",
			userid		= "",
			name		= "",
			email		= "",
			cert_email	= "";
	
	try{
		rs = stmt.executeQuery("select * from member where userid=\""+uid+"\" and password=password(\""+upass+"\")");
	
	//�α��� ����
	if(rs.next()){
		//������ �ҷ�����
		no			= rs.getString("no");
		userid		= rs.getString("userid");
		name		= rs.getString("name");
		email		= rs.getString("email");
		cert_email	= rs.getString("cert_email");
		
		// ���� ����
		session.setAttribute("sno",no);	
		session.setAttribute("sid",userid);	
		session.setAttribute("sname",name);	
		session.setAttribute("semail",email);
		session.setAttribute("scert_email",cert_email);
		
		response.sendRedirect("../index.jsp");	// �����̷��� ������
	}
	//�α��� ����
	else{
		response.sendRedirect("../error.jsp"); // �����̷��� ������
	}

	// ���� ��Ȳ ó�� ����
	}catch(SQLException sqlex){
		System.out.println("sql exception");
	}catch(Exception ex){
		System.out.println("exception");
	}finally{
		if(rs!=null)
			try{rs.close();}
		catch(SQLException ex){}
		if(stmt!=null)
			try{stmt.close();}
		catch(SQLException ex){}
		if(conn!=null)
			try{conn.close();}
		catch(Exception ex){}
	}
%>