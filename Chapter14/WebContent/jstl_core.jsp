<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% test.BeanTest2 ts=new test.BeanTest2(); %>
<jsp:useBean id="bt" class="test.BeanTest2" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set target="${bt }" property="name" value="홍길동"/>
<c:set var="tsTarget" value="<%=ts %>"/>
<c:set target="${tsTarget }" property="name" value="Hello"/>
	<%=bt.getName() %>&nbsp; ${bt.name }
<h3>${ts.name }</h3>
<h3>${tsTarget.name }</h3>
<c:out value="${tsTarget.name }"/>
<br>
<c:set var="t" value="<script>alert();</script>"/>
${t }

escapeXml true : <c:out value="${t }" escapeXml="true"/>
escapeXml false : <c:out value="${t }" escapeXml="false"/>
</body>
</html>