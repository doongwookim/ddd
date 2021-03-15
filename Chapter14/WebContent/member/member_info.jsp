<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<fmt:requestEncoding value="utf-8"/>

<c:if test="${id eq null or id ne 'admin' }">
	<script>
		alert('관리자로 실행하세요');
		location.href='loginForm.jsp';
	</script>
</c:if>



<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>
<sql:query var="rs" dataSource="${con }">
select*from member where id=?
<sql:param>${param.id }</sql:param>
</sql:query>

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
<c:set var="info" value="${rs.rows[0]}"/>${info.id}
<c:forEach var="row" items="${rs.rows }">
<table>
	<tr>
		<td>아이디 : </td>
		<td>"${row.id }"</td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td>"${row.password }"</td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td>"${row.name }"</td>
	</tr>
	<tr>
		<td>나이 : </td>
		<td>"${row.age}"</td>
	</tr>
	<tr>
		<td>성별 : </td>
		<td>"${row.gender }"</td>
	</tr>
	<tr>
		<td>이메일 주소 : </td>
		<td>"${row.email }"</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:choose>
				<c:when test="${id eq 'admin' }">
					<a href="member_list.jsp">리스트로 돌아가기</a></td>
				</c:when>
			</c:choose>
		</td>
	</tr>
	
	
	</table>
</c:forEach>
</body>
</html>