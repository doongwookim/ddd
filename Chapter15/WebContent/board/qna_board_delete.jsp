<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardBean" %>
<%
	String board_num=(String)request.getAttribute("BOARD_NUM");
	String nowPage=(String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#passForm{
		width:400px;
		margin: auto;
		border: 1px solid orange;
	}
</style>
</head>
<body>
	<section id="passForm">
		<form name="deleteForm" action="boardDeletePro.bo?BOARD_NUM=<%=board_num %>" method="post">
			<input type="hidden" name="page" value="<%=nowPage %>"/>
			<table>
				<tr>
					<td>
						<label>글 비밀번호 : </label>
					</td>
					<td>
						<input name="BOARD_PASS" type="password">
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="삭제"/>
						&nbsp;&nbsp;
						<input type="button" value="돌아가기"	onClick="javascript:history.go(-1)"/>
					</td>	
				</tr>
			</table>
		</form>
	</section>
</body>
</html>