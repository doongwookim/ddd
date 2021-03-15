<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
    <%
    Connection conn=null;
    PreparedStatement pstmt=null;
    StringBuffer sb=null;
    ResultSet rs=null;
    try{
    	Context init=new InitialContext();
    	DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    	conn=ds.getConnection();
    	pstmt=conn.prepareStatement("select*from clobtable where num=1");
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		out.println(rs.getString("content"));
    		
    	}
    }catch(Exception e){
    	e.printStackTrace();
    }finally{
    	try{
    		rs.close();
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