<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="utf-8"/>
<c:set var="age" value="${param.age eq null or fn:trim(param.age) eq '' ? '0' : param.age}"/>
<c:catch var='err'>
<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/> 
<sql:update var="result" dataSource="${con }"> 
	insert into member values(?,?,?,?,?,?)
	<sql:param>${param.id }</sql:param>
	<sql:param>${param.pass }</sql:param>
	<sql:param>${param.name }</sql:param>
	<sql:param>${param.age }</sql:param>
	<sql:param>${param.gender }</sql:param>
	<sql:param>${param.email }</sql:param>
</sql:update>

</c:catch>
<c:choose>
<c:when test="${err ne null}">
	<script>
		alert('오류발생');
		history.back();
	</script>
</c:when>
<c:otherwise>
	<c:choose>
		<c:when test="${result>0 }">
			<script>
			alert('가입 완료');
			location.href='loginForm.jsp'
			</script>
		</c:when>
<c:otherwise>
		<script>
			alert('가입실패');
		</script>
	</c:otherwise>
</c:choose>
</c:otherwise>
</c:choose>

