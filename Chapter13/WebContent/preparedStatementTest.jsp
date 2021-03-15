<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
       	
		String[] num=request.getParameterValues("num");
		String[] name=request.getParameterValues("name");
		Connection conn=null;
    	String sql="insert into student(num,name)values(?,?)";
    	
    	PreparedStatement pstmt=null;
    	try{
    		Context init=new InitialContext();
    		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    		conn=ds.getConnection();
    		pstmt=conn.prepareStatement(sql);
    		
    		for(int i=0;i<num.length;i++){
    		pstmt.setString(1, num[i]);
    		pstmt.setString(2, name[i]);
    		if(pstmt.executeUpdate()!=0){
    			out.println("<h3>"+num[i]+"번 레코드를 등록.</h3>");
    		}
    		}
    	}catch(Exception e){
    		out.println("<h3>레코드 등록 실패</h3>");
    		e.printStackTrace();
    	 }
    	finally{
    		try{
    			pstmt.close();
    			conn.close();
    		}
    		catch(Exception e){
    			e.printStackTrace();
    		}
    	}
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>