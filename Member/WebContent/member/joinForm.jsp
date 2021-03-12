<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 회원 가입 페이지</title>
<style>
	table {
		margin: auto;
		width: 600px;
		border: 1px solid gray;
		text-align: center;
	}
	.td_title {
		font-weight: bold;
		font-size: x-large;
	}
	td:nth-child(2) {
		text-align: left;
	}
	#idCheck,
	#postSr {
		margin-left: 3px;
	}
	#addr,
	#addrDtl {
		width: 400px;
	}
</style>
</head>
<body>
	<form action="joinProcess.mem" name="joinform" method="post" >
		<table border=1>
			<tr>
				<td colspan="2" class="td_title">회원 가입 페이지</td>
			</tr>
			<tr>
				<td><label for="id">아이디 : </label></td> 
				<td><input type="text" name="id" id="id" /><input type="button" value="아이디 중복확인" name="idCheck" id="idCheck" 
					onclick="window.open('idCheck1.jsp?openInit=true','','width=300,height=200')" /></td> <!-- ''부분은 blank랑 같은 효과 -->
			</tr>
			<tr>
				<td><label for="pass">비밀번호 : </label></td>
				<td><input type="password" name="pass" id="pass" /></td>
			</tr>
			<tr>
				<td><label for="passChk">비밀번호 확인 : </label></td>
				<td><input type="password" name="passChk" id="passChk" /></td>
			</tr>
			<tr>
				<td><label for="name">이름 : </label></td>
				<td><input type="text" name="name" id="name" /></td>
			</tr>
			<tr>
				<td><label for="age">나이 : </label></td>
				<td><input type="text" name="age" id="age" /></td>
			</tr>
			<tr>
				<td><label for="gender1">성별 : </label></td>
				<td>
					<input type="radio" name="gender" id="gender1" value="남" checked />남자
					<input type="radio" name="gender" id="gender2" value="여"/>여자
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일 주소 : </label></td>
				<td><input type="text" name="email" id="email" /></td>
			</tr>
			<tr>
				<td><label for="zip">우편번호 : </label></td>
				<td>
					<input type="text" name="zip" id="zip" size=6 readonly/>
					<input type="button" name="zipSearch" value="검색" id="zipSearch" onclick="window.open('zip.jsp','','width=800, height=600')" />
				</td>
			</tr>
			<tr>
				<td><label for="addr">주소 : </label></td>
				<td><input type="text" name="addr" id="addr" /></td>
			</tr>
			<tr>
				<td><label for="addrDtl">주소상세 : </label></td>
				<td><input type="text" name="addrDtl" id="addrDtl" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입" />
					<a href="javascript:formCheck(document.joinform);">회원가입</a>&nbsp;&nbsp;
					<a href="javascript:joinform.reset()">다시작성</a>
				</td>
			</tr>
		</table>
	</form>
	
	<script>
		// form 유효성 검사 함수 실행하기
		// 전송버튼 사용할 경우 <from onsubmit="return 함수()" 
		// 그외 하이퍼링크, 버튼 등등 직접호출하는 방식으로 호출해야 한다. / 함수에 submit()을 추가해야 한다.
		
		var chkId = false;
		var idcheck; 
		
		//유효성 검사
		function formCheck(f) {
			if(f.id.value.trim() == "") {				
				alert("아이디를 입력하세요.");
				f.id.value="";
				f.id.focus();
				return false; //잘못된 이곳에서 막아야됨
			} else if (f.pass.value.trim() == "") {
				alert("비밀번호를 입력하세요.");
				f.pass.value="";
				f.pass.focus();
				return false;		
			} else if(f.pass.value.length < 5 || f.pass.value.length > 10 ) {
				alert("비밀번호는 5~10자로 설정하세요 .");
				f.pass.value="";
				f.passChk.focus();
				return false; 
			}else if (f.pass.value.trim() != f.passChk.value.trim()) {
				alert("비밀번호가 일치 하지 않습니다.");
				f.pass.value="";
				f.passChk.value="";
				f.passChk.focus();
				return false;
			} else if (f.name.value.trim() == "") {
				alert("이름을 입력하세요.");
				f.name.value="";
				f.name.focus();
				return false;
			} else if (isNaN(f.age.value)) { //isNaN() 숫자인지 아닌지 확인 하는 함수
				alert("숫자만 입력하세요.");
				f.age.value="";
				f.age.focus();
				return false;
			} else if (f.email.value.trim() == "") {
				alert("이메일을 입력하세요");
				f.email.value="";
				f.email.focus();
				return false;
			}
				
			f.submit();
		}
	</script>
</body>
</html>