<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	request.setCharacterEncoding("utf-8");
       	
       	
       	String select="num";
       	if(request.getParameter("select")!=null)
       			select=request.getParameter("select");
       	
       	String search="%";
       	if(request.getParameter("search")!=null)
			 	search="%"+request.getParameter("search")+"%";
       	Connection conn=null;
       	
       	String sql="select*from student where "+select+" like ?";
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	
    	try{
    		Context init=new InitialContext();
    		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    		conn=ds.getConnection();
    		
    		pstmt=conn.prepareStatement(sql);
    	
    		pstmt.setString(1, search);
    		rs=pstmt.executeQuery();
    		
    		while(rs.next()){
    			out.println("<h3>"+rs.getInt(1)+","+rs.getString(2)+"</h3>");
    			
    		}
    		
    	}catch(Exception e){
    		out.println("<h3>데이터 가져오기 실패.</h3>");
    		e.printStackTrace();
    	}finally{
    		try{
    			if(rs!=null);
    				rs.close();
    			if(pstmt!=null);
    				pstmt.close();
    			if(conn!=null);
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