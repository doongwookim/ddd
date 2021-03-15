<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%
	if((session.getAttribute("id")==null)||(!((String)session.getAttribute("id")).equals("admin"))){
	out.println("<script>");
	out.println("alert('관리자로 로그인하세요')");
	out.println("location.href='loginForm.jsp'");
	out.println("</script>");
	}
	String mod_id=request.getParameter("id");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		DataSource ds=(DataSource)new InitialContext().lookup("java:comp/env/jdbc/OracleDB");
		conn=ds.getConnection();
		
		pstmt=conn.prepareStatement("select*from member where id=?");
		pstmt.setString(1, mod_id);
		rs=pstmt.executeQuery();
		
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
			margin:auto;
			width:500px;
			text-align: center;
			border:1px solid gray;
			}
	td:nth-child(2){
		text-align: left;
			}
	.td_title{
			font-weight: bold;
			font-size: x-large;
			}
</style>

</head>
<body>
<form name="memberMod" action="modifyProcess.jsp"method="post">
		<table border=1>
			<tr>
				<td colspan="2"class="td_title">
				회원 정보 수정 페이지
				</td>
			</tr>
<%if(rs.next()){ %>
			<tr>
				<td><label for="id">아이디 : </label></td>
				<td><input type="hidden" name="id" value='<%=rs.getString("id") %>'/><%=rs.getString("id") %></td>
			
			</tr>
			<tr>
				<td><label for="pass">비밀번호 : </label></td>
				<td><input type="password" name="pass" id="pass" value='<%=rs.getString("password") %>'/></td>
			</tr>
			<tr>
				<td><label for="name">이름 : </label></td>
				<td><input type="text" name="name" id="name"value='<%=rs.getString("name") %>'/></td>
			</tr>	
			<tr>
				<td><label for="age">나이 : </label></td>
				<td><input type="text" name="age" id="age"value='<%=rs.getString("age") %>'/></td>
			</tr>	
			<tr>
				<td><label for="gender1">성별 : </label></td>
				<td><input type="radio" name="gender" value="남" 
				<%=rs.getString("gender").equals("남")?"checked":"" %>
				checked id="gender1"/>남자
					<input type="radio" name="gender" value="여" 
					<%=rs.getString("gender").equals("여")?"checked":"" %>
					id="gender2"/>여자
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일 : </label></td>
				<td><input type="text" name="email" id="email"value='<%=rs.getString("email") %>'/></td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="javascript:memberMod.submit()">수정하기</a>&nbsp;&nbsp;
					<a href="javascript:joinform.reset()">초기화</a>&nbsp;&nbsp;
					<a href="javascript:history.back()">뒤로가기</a>	
				</td>	
			</tr>
			<%}else{ %>
			<td colspan="2">정보가 없습니다.
			<%} %>
			</table>
	</form>
</body>
</html>
<%
}
catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		pstmt.close()	;
		conn.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	}
%>
