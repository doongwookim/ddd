<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String openInit="false";
	if(request.getParameter("openInit")!=null){
		openInit="true";}%>
<script>
	function init(){
		if(<%=openInit%>){
			document.getElementById("id").value=opener.document.getElementById("id").value;
		}
	}
	
	function ok(v){
		opener.idcheck=v.trim();
		opener.document.getElementById("id").value=v;
		opener.chkId=true;
		window.close();
	}
	</script>	

<body onload="init()">
	<form name=f action="idCheckProcess.jsp"method="post">
		<input type=text name=id id=id>
		<input type=submit value="중복확인" >
	</form>
	<%
		if(request.getParameter("chk_id")!=null){
		String chk_id=request.getParameter("chk_id");
		String useble=request.getParameter("useble");
		out.print("<hr>");
		if(useble.equals("yes")){
			out.print("<h3>"+chk_id+"는 사용 가능한 아이디입니다.");
			out.print("<a href='#' onclick=\"ok('"+chk_id+"')\">사용하기</a></h3>");
		}else{
			out.print("<h3>"+chk_id+"는 사용 불가능한 아이디입니다.</h3>");
		}
		}
		%>
</body>
</html>