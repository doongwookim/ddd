<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="test" begin="1" end="10" step="2">

	<b>${test }</b>&nbsp;
</c:forEach>
<br>
<c:forTokens var="alphabet" items="a,b,x,d,e,f,g,h,i,j,k,l,m,n" delims=",">
	<b>${alphabet }</b>&nbsp;
</c:forTokens>	
<%String str="http://localhost:8088/Chapter14/jstl_core_ex.jsp"; %>
<c:forTokens var="strTest" items="<%=str %>" delims="/" begin="0" end="5" varStatus="st">
	<c:if test="${st.index<2 }">
	<b>${st }</b>&nbsp; ${st.index }</c:if>
</c:forTokens>
<br>
<c:set var="data" value="홍길동,김길동,고길동"/>
<c:forTokens var="varData" items="${data }" delims=","	>
	<b>${varData }</b>&nbsp;
</c:forTokens>
</body>
</html>