<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="zip.jsp" name="zip" method="post">
		<tr>
			<td><label for="addr">도로명 </label></td>
			<td><input type="text" name="addr" id="addr" required="required"/>
			<input type="submit" name="addrCheck" value="검색" id="addrCheck" onclick="window.open('zip.jsp?openInit=true','','width=300,height=200')"></td>
		</tr>
	</form>
	<%
	request.setCharacterEncoding("utf-8");
	String doro=request.getParameter("doro");
	
	if(doro!=null&&!doro.equals("")){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select*from zipCode where doro where doro like ?%";
	try{
		DataSource ds=(DataSource)new InitialContext().lookup("java:comp/env/jdbc/mySQLzip");
		conn=ds.getConnection();
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, doro);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			%>
<table border="1">
	<tr>
		<td>우편번호</td>
		<td>주소</td>
		<td></td>
	</tr>
<%
	do{
		String zipcode=rs.getString("zipcode");
		
		String address=rs.getString("sido")+" "
		+rs.getString("sigungu")+" "
		+rs.getString("eupmyeon")+" "
		+rs.getString("doro")+" "
		+rs.getString("buildingno1")+" "
		+rs.getString("buildingno2");
%>
<tr>
		<td><%=zipcode%></td>
		<td><%=address%></td>
		<td><input type="button" value="선택"/></td>
</tr>
<%		
	}while(rs.next());
%>
</table>
			<%
			
		}else{
			out.println("검색 결과가 없습니다.");
		}

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				rs.close();
				pstmt.close()	;
				conn.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}		
	}
	%>
	
</body>
</html>