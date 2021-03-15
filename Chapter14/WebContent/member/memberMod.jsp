<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="utf-8"/>

<c:if test="${id == null or id ne 'admin' }">
	<script>
	alert('관리자로 로그인하세요.');
	location.href="loginForm.jsp";
	</script>
</c:if>
	<<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>
	<sql:query var="result" dataSource="${con }">
	select *from member where id=?
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
			width:500px;
			text-align: center;
			border:1px solid gray;
			}
	td:nth-child(2){
		text-align: left;
			}
	.td_title{
			font-weight: bold;
			font-size: x-large;
			}
</style>

</head>
<body>
<form name="memberMod" action="modifyProcess.jsp"method="post">
		<table border=1>
			<tr>
				<td colspan="2"class="td_title">
				
				회원 정보 수정 페이지
				</td>
			</tr>
			<c:choose>
			<c:when test="${!empty rs.rows[0] ne null}">

			<tr>
				<td><label for="id">아이디 : </label></td>
				<td><input type="hidden" name="id" value='${rs.rows[0].id }'/>'${rs.rows[0].id }'</td>
			
			</tr>
			<tr>
				<td><label for="pass">비밀번호 : </label></td>
				<td><input type="password" name="pass" id="pass" value='${rs.rows[0].pass }'/></td>
			</tr>
			<tr>
				<td><label for="name">이름 : </label></td>
				<td><input type="text" name="name" id="name"value='${rs.rows[0].name }'/></td>
			</tr>	
			<tr>
				<td><label for="age">나이 : </label></td>
				<td><input type="text" name="age" id="age"value='${rs.rows[0].age }'/></td>
			</tr>	
			<tr>
				<td><label for="gender1">성별 : </label></td>
				<td><input type="radio" name="gender" value="남" '${rs.rows[0].gender eq '남'? }'checked id="gender1"/>남자
					<input type="radio" name="gender" value="여" '${rs.rows[0].gender eq '여'?}'
					id="gender2"/>여자
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일 : </label></td>
				<td><input type="text" name="email" id="email"value='${rs.rows[0].email }'/></td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="javascript:memberMod.submit()">수정하기</a>&nbsp;&nbsp;
					<a href="javascript:joinform.reset()">초기화</a>&nbsp;&nbsp;
					<a href="javascript:history.back()">뒤로가기</a>	
				</td>	
			</tr>
			</c:when>
			<c:otherwise>	
			<tr>
			<td colspan="2">정보가 없습니다.
			</td>
			</tr>
			</c:otherwise>
			</c:choose>
			</table>
	</form>
</body>
</html>

