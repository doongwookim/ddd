<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
    Connection conn=null;
    
   	String driver="oracle.jdbc.driver.OracleDriver";
   	String url="jdbc:oracle:thin:@localhost:1521:XE";
   	
   	Boolean connect=false;
   	
   	try{
   		Class.forName(driver);
   		conn=DriverManager.getConnection(url,"java","java");
   		
   		connect=true;
   		
   		conn.close();
   	}catch(Exception e){
   		connect=false;
   		e.printStackTrace();
   		
   	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><%if(connect==true){
	%>
	연결됨.
	<%}else{ %>
	연결 실패.
	<%}%></h2>

</body>
</html>