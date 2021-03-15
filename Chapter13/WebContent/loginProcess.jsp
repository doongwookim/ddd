<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="utf-8" /> 

<c:set var="loginId" value="${param.id }"/>   		 <!-- 넘어오는 id 값 설정 -->
<c:set var="pass" value="${param.pass }"/>   		 <!-- 넘어오는 password 값 설정 -->

<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>  
<sql:query var="rs" dataSource="${con }"> 
	select * from member where id=?
	<sql:param>${loginId }</sql:param>
</sql:query>
	
<c:forEach var="row" items="${ rs.rows }">		 <!-- items가 위에서 잡은 rs를 응용한다. / rs.rows가 1개 이상이라면 무조건 실행된다. 1개의 값이라도 존재한다는 의미 -->
	<c:if test="${row.password == pass }"> 		<!-- rs(db에서 얻은 값).password 값이 위에 설정한 password값이랑 같은지 다른지 비교 -->
		<c:set var="id" value="${loginId }" scope="session"/>			 <!-- scope를 session으로 넣어줘야 변수가 동작한다. //중복해서 사용할 경우에 scope를 사용 -->
		<c:redirect url="main.jsp"/>		 <!-- redirect를 이용한 직접적인 page이동 -->
	</c:if>
</c:forEach>

<script>
	alert('아이디나 비밀번호가 일치하지 않습니다.'); 		// 위의 글이 실행되지 않으면 script가 실행이 된다.
	location.href='loginForm.jsp';
</script>
