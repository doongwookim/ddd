<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.MemberBean" %>
<%
	MemberBean member=(MemberBean)request.getAttribute("member");		
%>
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
<form name="memberMod" action="memberModPro.mem"method="post">
		<table border=1>
			<tr>
				<td colspan="2"class="td_title">회원 정보 수정 페이지</td>
			</tr>
			<tr>
				<td><label for="id">아이디 : </label></td>
				<td><input type="hidden" name="id" value='${member.id }'/></td>
			
			</tr>
			<tr>
				<td><label for="pass">비밀번호 : </label></td>
				<td><input type="password" name="pass" id="pass" value='${member.pass }'/></td>
			</tr>
			<tr>
				<td><label for="name">이름 : </label></td>
				<td><input type="text" name="name" id="name"value='${member.name }'/></td>
			</tr>	
			<tr>
				<td><label for="age">나이 : </label></td>
				<td><input type="text" name="age" id="age"value='${member.age }'/></td>
			</tr>	
			<tr>
				<td><label for="gender1">성별 : </label></td>
				<td><input type="radio" name="gender" value="남" ${member.gender eq '남' ? 'cheched':''}checked id="gender1"/>남자
					<input type="radio" name="gender" value="여" ${member.gender eq '여' ? 'checked':''}id="gender2"/>여자
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일 : </label></td>
				<td><input type="text" name="email" id="email"value='${member.email }'/></td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="javascript:memberMod.submit()">수정하기</a>&nbsp;&nbsp;
					<a href="javascript:joinform.reset()">초기화</a>&nbsp;&nbsp;
					<a href="javascript:history.back()">뒤로가기</a>	
				</td>	
			</tr>
			
			<td colspan="2">정보가 없습니다.
		
			</table>
	</form>
</body>
</html>
