<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="utf-8"/>
<c:choose>
	<c:when test="${param.age eq null or fn:trim(param.age) eq '' ? '0' : param.age}">
		<script>
			alert('관리자로 로그인하세요');
			location.href='loginForm.jsp';
		</script>
	</c:when>
</c:choose>

<c:set var="id" value="${param.id }"></c:set>
<c:set var="id" value="${param.pass }"></c:set>
<c:set var="id" value="${param.name }"></c:set>
<c:set var="age" value="${param.age eq null or fn:trim(param.age) eq '' ? '0' : param.age}"/>
<c:set var="id" value="${param.gender }"></c:set>
<c:set var="id" value="${param.email }"></c:set>

<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/> 

<sql:query var="sql">
	update member set password=?,name=?,age=?,gender=?,email=? where id=?
</sql:query> 
	<sql:param>${param.id }</sql:param>
	<sql:param>${param.pass }</sql:param>
	<sql:param>${param.name }</sql:param>
	<sql:param>${param.age }</sql:param>
	<sql:param>${param.gender }</sql:param>
	<sql:param>${param.email }</sql:param>
	
	<c:choose>
	<c:when test="${con ne 0 }">
		<script>
			alert('수정 성공');
			location.href="member_info.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('수정 실패');
			location.href="history.back()";
		</script>
	</c:otherwise>
</c:choose>

