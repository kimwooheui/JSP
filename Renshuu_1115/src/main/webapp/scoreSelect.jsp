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
		<h1>학생조회</h1>
		<table>
			<tr>
				<th>학번</th>
				<th>학생이름</th>
				<th>주민번호</th>
				<th>학과</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>이메일</th>
			</tr>
		<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","hr","hr");
			String select = "select student.SID, "
					+ "student.SNAME, substr(student.JUMIN,1,6)||'-'||substr(student.JUMIN,7,13) as jumin, "
					+ "student.DEPT_NAME, "
					+ "decode(substr(student.JUMIN,7,1),1,'남자',3,'남자',2,'여자',4,'여자') as gender, "
					+ "student.PHONE, student.EMAIL "
					+ "from TBL_STUDENT_202210 student, TBL_SCORE_202210 score, TBL_SUBJECT_202210 subject "
					+ "where score.STUID = student.SID "
					+ "and subject.SUBCODE = score.SUBCODE";
			PreparedStatement pstmt = conn.prepareStatement(select);
			//Statement stmt = conn.createStatement();
			ResultSet rs = pstmt.executeQuery();
			//ResultSet rs = stmt.executeQuery(select2);
			while(rs.next()){
				%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td><%= rs.getString(5) %></td>
				<td><%= rs.getString(6) %></td>
				<td><%= rs.getString(7) %></td>
			</tr>
					<%}
			conn.close();
			pstmt.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		%>	
		</table>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>
