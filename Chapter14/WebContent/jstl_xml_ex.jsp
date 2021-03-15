<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<x:parse var="xmldata">
<students>
	<student>
		<name>홍길동</name>
		<age>30</age>
		<gender>남</gender>
		<phone>010-6511-4182</phone>
	</student>
	<student>
		<name>김길동</name>
		<age>22</age>
		<gender>여</gender>
		<phone>010-1234-5678</phone>
	</student>
	<student>
		<name>박남순</name>
		<age>72</age>
		<gender>여</gender>
		<phone>010-1154-5448</phone>
	</student>
	<student>
		<name>김승수</name>
		<age>22</age>
		<gender>남</gender>
		<phone>없음</phone>
	</student>
</students>
</x:parse>

<x:forEach select="$xmldata//student">
	<x:if select="./name!='박남순'">
	<x:out select="./name"/>
	<x:set select="./age" var="age"/>
	<x:out select="$age"/>
	<x:out select="./gender"/>
	
	<x:choose>
		<x:when select="./phone!='없음'">
		[전화번호 : <x:out select="./phone"/>]
		</x:when>
		<x:otherwise>
		[전화없음]
		</x:otherwise>
	</x:choose>
	<br>
	</x:if>
	</x:forEach>
</body>
</html>