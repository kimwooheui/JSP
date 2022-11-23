<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*,java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<section>
		<h1>성적등록</h1>
		<form action="action.jsp" name="frm" method="post">
			<table>
				<tr>
					<th>학번</th>
					<td><input type="text" name="STUID"></td>
				</tr>
				<tr>
					<th>과목코드</th>
					<td>
						<select name="SUBCODE">
							<option value="">----선택하시오----</option>
							<option value="A001">A001-자바</option>
							<option value="A002">A002-C언어</option>
							<option value="A003">A003-데이터베이스</option>
							<option value="A004">A004-웹프로그래밍</option>
							<option value="A005">A005-영어</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>중간고사</th>
					<td><input type="text" name="MIDSCORE"></td>
				</tr>
				<tr>
					<th>기말고사</th>
					<td><input type="text" name="FINALSCORE"></td>
				</tr>
				<tr>
					<th>출석</th>
					<td><input type="text" name="ATTEND"></td>
				</tr>
				<tr>
					<th>레포트</th>
					<td><input type="text" name="REPORT"></td>
				</tr>
				<tr>
					<th>기타</th>
					<td><input type="text" name="ETC"></td>
				</tr>
			</table>
			<input type="submit"  value="등록"  onClick="check(); return false;" >
		</form>
	</section>
	<script>
		function check() {
			if (document.frm.STUID.value=="") {
				alert("학생ID가 비었습니다.");
				document.frm.STUID.focus();
				return false;				
			}
			if (isNaN(document.frm.STUID.value)) {
				alert("학생ID가 숫자가 아닙니다.");
				document.frm.STUID.focus();
				return false;				
			}
			if (document.frm.SUBCODE.value=="") {
				alert("과목코드를 선택하세요.");
				document.frm.SUBCODE.focus();
				return false;				
			}

			if (document.frm.MIDSCORE.value=="") {
				alert("중간고사가 비었습니다.");
				document.frm.MIDSCORE.focus();
				return false;				
			}
			if (isNaN(document.frm.MIDSCORE.value)) {
				alert("중간고사가 숫자가 아닙니다.");
				document.frm.MIDSCORE.focus();
				return false;				
			}
			if (document.frm.FINALSCORE.value=="") {
				alert("기말고사가 비었습니다.");
				document.frm.FINALSCORE.focus();
				return false;				
			}
			if (isNaN(document.frm.FINALSCORE.value)) {
				alert("기말고사가 숫자가 아닙니다.");
				document.frm.FINALSCORE.focus();
				return false;				
			}
			if (document.frm.ATTEND.value=="") {
				alert("출석이 비었습니다.");
				document.frm.ATTEND.focus();
				return false;				
			}
			if (isNaN(document.frm.ATTEND.value)) {
				alert("출석이 숫자가 아닙니다.");
				document.frm.ATTEND.focus();
				return false;				
			}
			if (document.frm.REPORT.value=="") {
				alert("레포트가 비었습니다.");
				document.frm.REPORT.focus();
				return false;				
			}
			if (isNaN(document.frm.REPORT.value)) {
				alert("레포트가 숫자가 아닙니다.");
				document.frm.REPORT.focus();
				return false;				
			}
			if (document.frm.ETC.value=="") {
				alert("기타가 비었습니다.");
				document.frm.ETC.focus();
				return false;				
			}
			if (isNaN(document.frm.ETC.value)) {
				alert("기타가 숫자가 아닙니다.");
				document.frm.ETC.focus();
				return false;				
			}
			document.frm.submit();
		}
	</script>
	<jsp:include page="footer.jsp" />
</body>
</html>
