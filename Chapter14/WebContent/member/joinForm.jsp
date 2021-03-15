<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<script>
var chkId=false;
var idcheck;
function chkForm(f){
	if(!chkId||idcheck!=f.id.value.trim()){
		alert("아이디 중복을 확인하세요");
		return false;
	}
}
	function formCheck(f){
		if(f.id.value.trim() == "" ) {
	        alert("아이디를 입력하시오");
	        f.id.value="";
	        f.id.focus();
	        return false;
		}
		
		if(f.pass.value.trim()==""){
			alert("암호를 입력하시오");
			f.pass.value="";
			f.pass.focus();
			return false;
		}
		if(f.pass.value.length<5 || f.pass.value.length>10){
			alert("양식이 다릅니다.");
			f.pass.value="";
			f.passchk.value=""	;
			f.pass.focus();
			return false;
		}
		if(f.pass.value.trim()!=f.passchk.value.trim()){
			alert("비밀번호가 다릅니다.");
			f.pass.value="";
			f.passchk.value=""	;
			f.pass.focus();
			return false;
		}
		if(isNaN(f.age.value)){
			alert("숫자만 입력하세요.");
			f.age.value="";
			f.age.focus();
		}
		//f.submit();
		}
	
	
</script>
</head>
<body>
	<form name="joinform" action="joinProcess.jsp"method="post">
		<table border=1>
			<tr>
				<td colspan="2"class="td_title">
				회원 가입 페이지
				</td>
			</tr>
			<tr>
				<td><label for="id">아이디 : </label></td>
				<td><input type="text" name="id" id="id" required="required"/>
				<input type="button" name="idCheck" value="아이디 중복 확인" id="idCheck" onclick="window.open('idCheck.jsp?openInit=true','','width=300,height=200')"></td>
			</tr>
			<tr>
				<td><label for="pass">비밀번호 : </label></td>
				<td><input type="password" name="pass" id="pass"/></td>
			</tr>
			<tr>
				<td><label for="passAgain">비밀번호 확인 : </label></td>
				<td><input type="password" name="passAgain" id="passAgain"/></td>
			</tr>		
			<tr>
				<td><label for="name">이름 : </label></td>
				<td><input type="text" name="name" id="name"/></td>
			</tr>	
			<tr>
				<td><label for="age">나이 : </label></td>
				<td><input type="text" name="age" id="age"/></td>
			</tr>	
			<tr>
				<td><label for="gender1">성별 : </label></td>
				<td><input type="radio" name="gender" value="남" checked id="gender1"/>남자
					<input type="radio" name="gender" value="여" id="gender2"/>여자
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일 : </label></td>
				<td><input type="email" name="email" id="email"/></td>
			</tr>
			<tr>
				<td><label for="post">우편번호 : </label></td>
				<td align="left"><input type="text" name="zip" id="zip" size=6 readonly/>
					<input type="button" name="zipSearch" value="검색" id="zipSearch" onclick="window.open('zip.jsp','','width=800, height=600')"/>
				</td>
			</tr>
			<tr>
				<td><label for="addr" >주소: </label></td>
				<td><input type="text" name="addr" id="addr"/></td>
			</tr>
			<tr>
				<td><label for="post" >주소상세 : </label></td>
				<td><input type="text" name="post" id="post"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송"/>
					<a href="javascript:formCheck(document.joinform);">회원 가입</a>&nbsp;&nbsp;
					<a href="javascript:joinform.reset()">다시 작성</a>	
				</td>	
			</tr>
			</table>
	</form>

</body>
</html>