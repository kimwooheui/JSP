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
		<h1>성적조회</h1>
		<table>
			<tr>
			<th>학번</th>
			<th>성명</th>
			<th>교과목</th>
			<th>교과목코드</th>
			<th>담당교수</th>
			<th>중간</th>
			<th>기말</th>
			<th>출석</th>
			<th>레포트</th>
			<th>기타</th>
			<th>평균</th>
			<th>총점</th>
			<th>학점</th>
		</tr>
		<%
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","hr","hr");
			String select = "select student.SID, "
					+"student.SNAME, "
					+"subject.SUBNAME, "
					+"score.SUBCODE, "
					+"subject.PRONAME, "
					+"score.MIDSCORE, "
					+"score.FINALSCORE, "
					+"score.ATTEND, "
					+"score.REPORT, "
					+"score.ETC, "
					+"trunc(sum(score.MIDSCORE+score.FINALSCORE+score.REPORT+score.ETC+score.ATTEND)/5) as avgR, "
					+"trunc((score.MIDSCORE*0.3)+(score.FINALSCORE*0.3)+(score.REPORT*0.1)+(score.ETC*0.1)+(score.ATTEND*0.2)) as totalR "
					+"from TBL_STUDENT_202210 student, TBL_SCORE_202210 score , TBL_SUBJECT_202210 subject "
					+"where student.SID = score.STUID "
					+"and subject.SUBCODE = score.SUBCODE "
					+"group by (student.SID, "
							+"student.SNAME, "
							+"subject.SUBNAME, "
							+"score.SUBCODE, "
							+"subject.PRONAME, "
							+"score.MIDSCORE, "
							+"score.FINALSCORE, "
							+"score.ATTEND, "
							+"score.REPORT, "
							+"score.ETC)";

			PreparedStatement pstmt = conn.prepareStatement(select);
			//Statement stmt = conn.createStatement();
			ResultSet rs = pstmt.executeQuery();
			//ResultSet rs = stmt.executeQuery(select2);
			while(rs.next()){
			//	Integer avg = (int)Double.parseDouble(rs.getString(11));
				Integer avg = rs.getInt(11);
			//	Integer total = Integer.parseInt(str);
				Integer total = rs.getInt(12);
				String rank = "꽝";
						if(total>95){
							rank = "A+";
						}else if(total>90){
							rank = "A";
						}else if(total>85){
							rank = "B+";
						}else if(total>80){
							rank = "B";
						}else if(total>75){
							rank = "C+";
						}else if(total>70){
							rank = "C";
						}else if(total>65){
							rank = "D+";
						}else if(total>60){
							rank = "D";
						}
						else{
							rank="F";
						}
				%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td><%= rs.getString(5) %></td>
				<td><%= rs.getString(6) %></td>
				<td><%= rs.getString(7) %></td>
				<td><%= rs.getString(8) %></td>
				<td><%= rs.getString(9) %></td>
				<td><%= rs.getString(10) %></td>
				<td><%= avg %></td>
				<td><%= total %></td>
				<td><%= rank %></td>
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
