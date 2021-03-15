<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("utf-8");
if(session.getAttribute("id")!=null || !((String)session.getAttribute("id")).equals("admin")){
	out.println("<script>");
	out.println("alert('관리자로 로그인하세요')");
	out.println("<location.href='loginFrom.jsp'>");
	out.println("</script>");
}
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age")==null||request.getParameter("age").trim().equals("")?"0":request.getParameter("age").trim());
	String gender=request.getParameter("gender");
	String email=request.getParameter("email");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	String sql=("update member set password=?,name=?,age=?,gender=?, email=? where id=?");
	
	try{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn=ds.getConnection();
		conn.setAutoCommit(false);
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, pass);
		pstmt.setString(2, name);
		pstmt.setInt(3, age);
		pstmt.setString(4, gender);
		pstmt.setString(5, email);
		pstmt.setString(6,id);
		int result=pstmt.executeUpdate();
		
		if(result!=0){
			conn.commit();
			out.println("<script>");
			out.println("alert('수정 성공했습니다.')");
			out.println("location.href='member_info.jsp?id="+id+"'");
			out.println("</script>");
		}else{
			conn.rollback();
			out.println("<script>");
			out.println("alert('수정 실패했습니다')");
			out.println("history.back()");
			out.println("</script>");
		}
	}catch(Exception e){
		e.printStackTrace();
		if(conn!=null)
		conn.rollback();
		out.println("<script>");
		out.println("alert('오류 발생했습니다')");
		out.println("history.back()");
		out.println("</script>");
	}finally{
			pstmt.close()	;
			conn.close();
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