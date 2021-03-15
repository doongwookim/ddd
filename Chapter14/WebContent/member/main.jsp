<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${id }로 로그인 하였습니다.</h3>
<a href="logout.jsp">로그아웃</a>&nbsp;
<a href="memberMod.jsp">회원 정보 수정</a>
<c:if test="${id ne null and id eq 'admin'}">
	<a href="member_list.jsp">관리자 모드 접속(회원 목록 보기)</a>
</c:if>
</body>
</html>