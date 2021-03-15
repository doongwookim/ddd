<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardBean" %>    
<%
	BoardBean article=(BoardBean)request.getAttribute("article");
	String nowPage=(String)request.getAttribute("page");
	if(nowPage==null)nowPage="1";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
	#articleForm {
		width: 500px;
		height: 500px;
		border: 1px solid red;
		margin: auto;
		padding: 10px;
	}
	
	h2 {
		text-align: center;
	}
	
	#basicInfoArea {
		height: 40px;
		text-align: center;
	}
	
	#articleContentArea {
		background: rgba(255,165,0, 0.21);
		margin-top: 20px;
		height: 350px;
		text-align: center;
		overflow: auto;
	}
	
	#commandList {
		margin: auto;
		width: 500px;
		text-align: center;
	}
</style>
</head>
<body>
	<!-- 게시판 수정 -->
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제목 : <%=article.getBOARD_SUBJECT() %>
			첨부파일 : <%if(!(article.getBOARD_FILE() == null)) { %>
				<a href="file_down?downFile=<%=article.getBOARD_FILE() %>"> <%=article.getBOARD_FILE() %></a>
				<%} %>
		</section>
		<section id="articleContentArea">
			<%=article.getBOARD_CONTENT() %>
		</section>
	</section>
	<section id="commandList">
		<a href="boardReplyForm.bo?BOARD_NUM=<%=article.getBOARD_NUM() %>&PAGE=<%=nowPage %>">[답변]</a>&nbsp;
		<a href="boardModifyForm.bo?BOARD_NUM=<%=article.getBOARD_NUM() %>&PAGE=<%=nowPage %>">[수정]</a>&nbsp;
		<a href="boardDeleteForm.bo?BOARD_NUM=<%=article.getBOARD_NUM() %>">[삭제]</a>&nbsp;
		<a href="boardList.bo?PAGE=<%=nowPage %>">[목록]</a>&nbsp;&nbsp;
	</section>
</body>
</html>