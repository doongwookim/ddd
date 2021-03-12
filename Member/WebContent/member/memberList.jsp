<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	ArrayList<MemberBean> memberList = (ArrayList<MemberBean>)request.getAttribute("memberList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 관리자모드 (회원 목록 보기)</title>
<style>
	table{
		margin: auto;
		width: 400px;
		border: 1px solid gray;
		text-align: center;
	}
	.td_title {
		font-weight: bold; 
		font-size: x-large;
	}
	#pageList {
		margin-top: 15px;
		text-align: center;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<td colspan=2 class="td_title">회원 목록</td>
		</tr>
		<%for(int i = 0; i < memberList.size(); i++) { %>
		<tr>
			<td>
				<a href="memberInfo.mem?id=<%=memberList.get(i).getId()%>"><%=memberList.get(i).getId() %></a>
			</td>
			<td>
				<a href="memberModForm.mem?id=<%=memberList.get(i).getId() %>">수정</a>&nbsp;
				<a href="javascript:deleteMember('<%=memberList.get(i).getId() %>')">삭제</a>				
			</td>
		</tr>
		<%} %>
	</table>
	
		<section id="pageList">
		<%if(nowPage <= 1) { %> <%-- 비활성화 --%>
			[이전]&nbsp;
		<%} else { %>
			<a href="memberList.mem?page=<%=nowPage - 1 %>">[이전]</a> &nbsp;
		<%} %>
		
		<%for (int a = startPage; a <= endPage; a++) { %>
			<%if(a == nowPage) { %>
				[<%=a %>]
			<%} else { %>
				<a href="memberList.mem?page=<%=a %>">[<%=a %>]</a>&nbsp;
			<%} %>
		<%} %>
		<%if (nowPage >= maxPage) { %>
			[다음]
		<%} else { %>
			<a href="memberList.mem?page=<%=nowPage + 1 %>">[다음]</a>
		<%} %>
	</section>
	<script>
		function deleteMember(id) {
			if(confirm('정말 삭제하심?')){
				location.href='memberDelete.mem?id='+id;
			}
		}
	</script>
</body>
</html>