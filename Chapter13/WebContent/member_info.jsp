<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>

<%

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
			margin:auto;
			width:400px;
			border:1px solid gray;
			text-align: center;
			}
		
</style>
</head>
<body>
<table>
	<tr>
		<td>아이디 : </td>
		<td><%=rs.getString("id") %></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><%=rs.getString("password") %></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><%=rs.getString("name") %></td>
	</tr>
	<tr>
		<td>나이 : </td>
		<td><%=rs.getString("age") %></td>
	</tr>
	<tr>
		<td>성별 : </td>
		<td><%=rs.getString("gender") %></td>
	</tr>
	<tr>
		<td>이메일 주소 : </td>
		<td><%=rs.getString("email") %></td>
	</tr>
	<tr>
		<td colspan="2"><a href="member_list.jsp">리스트로 돌아가기</a></td>
	</tr>
	
	
	</table>
</body>
</html>