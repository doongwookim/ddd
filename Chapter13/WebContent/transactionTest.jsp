<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    String sql="insert into student (num,name) values (13,'강질순')";
    String sql2="select *from student where num=12";
    
    try{
    		Context init=new InitialContext();
    		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    		conn=ds.getConnection();
    		
    		conn.setAutoCommit(false);
    		
    		pstmt=conn.prepareStatement(sql);
    		pstmt.executeUpdate();
    		
    		pstmt=conn.prepareStatement(sql2);
    		rs=pstmt.executeQuery();
    		if(!rs.next()){
    			conn.rollback();
    			out.println("<h3>에이터 삽입에 문제가 발생해서 롤백.</h3>");
    		}else{
    			conn.commit();
    			out.println("<h3>데이터 삽입이 완료.</h3>");
    		}
    		
    }catch(Exception e){
    	out.println("<h3>데이터 삽입에 실패</h3>");
    	e.printStackTrace();
    }finally{
    	try{
    		rs.close();
    		pstmt.close();
    		conn.close();
    	}catch(Exception e){
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