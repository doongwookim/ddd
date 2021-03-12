<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 관리자모드 (회원 정보 보기)</title>
<style>
	table{
		margin: auto;
		width: 400px;
		border: 1px solid gray;
		text-align: center;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<td>아이디 : </td>
			<td>${member.id }</td>
		</tr>
		<tr>
			<td>비밀번호 : </td>
			<td>${member.pass}</td>
		</tr>
		<tr>
			<td>이름 : </td>
			<td>${member.name }</td>
		</tr>
		<tr>
			<td>나이 : </td>
			<td>${member.age }</td>
		</tr>
		<tr>
			<td>성별 : </td>
			<td>${member.gender }</td>
		</tr>
		<tr>
			<td>이메일 주소 : </td>
			<td>${member.email }</td>
		</tr>
		<tr>
			<td colspan="2"><a href="memberList.mem">리스트로 돌아가기</a>
		</tr>
	</table>
</body>
</html>
