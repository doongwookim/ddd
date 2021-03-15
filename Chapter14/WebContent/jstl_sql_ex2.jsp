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
<sql:transaction dataSource="${con }" isolation="read_committed">
<sql:update dataSource="${con }" sql="insert into test (num,name) values (?,?)">
	<sql:param value="12"/>
	<sql:param value="홍길동"/>
</sql:update>
<sql:update>
	insert into test (num,name) values (9,'조둔동')
</sql:update>
<sql:update >
	insert into test (num,name) values (10,'조둔동')
</sql:update>
<sql:update>
	insert into test (num,name) values (11,'조둔동')
</sql:update>

<sql:query var="rs" dataSource="${con }">
	select*from test where name=?
	<sql:param>홍길동</sql:param>
	</sql:query>
	</sql:transaction>
<c:forEach var="data" items="${rs.rows}">
	<c:out value="${data['num'] }"/>
	<c:out value="${data['name'] }"/>
	<br>
</c:forEach>
</body>
</html>