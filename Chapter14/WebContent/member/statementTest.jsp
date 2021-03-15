<%@page import="javax.naming.*"%>
<%@page import="javax.sql.*"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	String num=request.getParameter("num");
		String name=request.getParameter("name");
    	Connection conn=null;
    	
    	String sql="INSERT INTO student(num,name)values("+num+",'"+name+"')";
    	
    	
    	Statement stmt=null;
    	try{
    	Context init=new InitialContext();
    	DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    	conn=ds.getConnection();
    	stmt=conn.createStatement();
    	
    	int result=stmt.executeUpdate(sql);
    	if(result!=0){
    		out.println("<h3>레코드가 등록됨.</h3>");
    		}
    		}catch(Exception e){
    			out.println("<h3>등록 실패.</h3>");
    			e.printStackTrace();
    			}
    			finally{
    			try{
    			stmt.close();
    			conn.close();
    			}
    			catch(Exception e){
    			e.printStackTrace();
    			}
    			}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>