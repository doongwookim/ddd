<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>

<sql:update dataSource="${con }" sql="insert into test (num,name) values (?,?)">
	<sql:param value="10"/>
	<sql:param value="홍길동"/>
</sql:update>
<sql:update dataSource="${con }">
	insert into test (num,name) values (6,'조둔동')
</sql:update>
<sql:update dataSource="${con }">
	insert into test (num,name) values (7,'조둔동')
</sql:update>
<sql:update dataSource="${con }">
	insert into test (num,name) values (8,'조둔동')
</sql:update>

<sql:query var="rs" dataSource="${con }">
	select*from test where name=?
	<sql:param>홍길동</sql:param>
	</sql:query>
<c:forEach var="data" items="${rs.rows}">
	<c:out value="${data['num'] }"/>
	<c:out value="${data['name'] }"/>
	<br>
</c:forEach>
</body>
</html>