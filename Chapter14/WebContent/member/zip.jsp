<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
</head>
<body>
	<form action="zip.jsp" method="post">
		<span><b>도로명 검색 : </b></span>
		<input type="text" name="doro" />
		<input type="submit" value="검색" />
	</form>
	<p />
	<script>
	function ok(f){
		opener.document.getElementById("zip").value=f.zip.value;
		opener.document.getElementById("addr").value=f.addr.value;
		window.close();
	}
	</script>

<%
	request.setCharacterEncoding("utf-8");

	String doro = request.getParameter("doro");
	
	if(doro != null && !doro.equals("")) {  //도로명이 null이거나 빈값인지를 확인하는 조건문
		
		String[] doro1= doro.split(" ");
		String[] doro2={"",""};
		if(doro1.length>1){
			doro2=doro1[1].split("-");
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from zipcode where doro like ?"+"and buildingno1 like ? and buildingno2 like ?";
	// 느림 /index를 생성시켜서 사용하면 더 빠르다.
	// ex) create index idx_zip on zipcode (doro, buildingno1, buildingno2); // index 생성 
	
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/mySQLZip");
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, doro1[0]+"%");
			pstmt.setString(2, doro2[0]+"%");
			pstmt.setString(3, (doro2.length>1? doro2[1]:"")+"%");
			rs = pstmt.executeQuery();
		
			if(rs.next()) { //rs.next()값이 빈값이 아닐경우
	%>
	<table border=1>
		<tr>
			<td>우편번호</td>
			<td>주소</td>
			<td>선택</td>
		</tr>
		<%
			do {
				String zipcode = rs.getString("zipcode"); //rs.getString(DB의 값을 호출하는 방식) rs.getString()을 통해서 ()안의 값을 String 값으로 변환해서 가져올 수 있다.
				String address = rs.getString("sido") +" " +rs.getString("sigungu") +" " +rs.getString("eupmyeon") +" " +rs.getString("doro") +" " +rs.getString("buildingno1") +"-" +rs.getString("buildingno2");
				// zipcode는  우편번호에 들어가는 값이다 ,address는  주소 부분에 들어가는 값이다.
		%>
		<form>
			<tr>
				<td>
					<%=zipcode %>
					<input type="hidden" name="zip" id="zip" value="<%=zipcode%>"/>
				</td>
				<td>
					<%=address %>
					<input type="hidden" name="addr" id="addr" value="<%=address%>"/>
				</td>
				<td>
					<input type="button" value="선택" onclick="ok(this.form)"/>
				</td>
			</tr>
		</form>	
		<%
			} while(rs.next()); {}//한번 찍어줘야한다 --> 위에서 조건문으로 rs.next()를 한번 사용했었음. 그래서 do ~ while문 사용
			// do while문을 사용해서 do에 나오는 값을 while로 반복시켜주는 역활을 한다.
		%>
	</table>	
	<%			
			} else {
				out.println("검색 결과가 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) { rs.close();}
				if(pstmt != null) { pstmt.close();}
				if(conn != null) { conn.close();}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
		%>
</body>
</html>