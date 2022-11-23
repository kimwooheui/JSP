<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>
	<div class="title">강사조회</div>
<table>
	<tr>
		<th>강사코드</th>
		<th>강사명</th>
		<th>강의명</th>
		<th>수강료</th>
		<th>강사자격취득일</th>
	</tr>
<%			
	Connection con = null;		
	PreparedStatement pstmt = null;
	String select = "select "
			+"TEACHER_CODE,"
			+"TEACHER_NAME,"
			+"CLASS_NAME,"
			+"to_char(CLASS_PRICE,'L999,999,999'),"
			+"substr(TEACHER_REGIST_DATE,1,4)||'년'||substr(TEACHER_REGIST_DATE,5,2)||'월'||substr(TEACHER_REGIST_DATE,7)||'일'" 
			+"from TBL_TEACHER_202201";
	try {		
		Class.forName("oracle.jdbc.driver.OracleDriver");	
		con = DriverManager.getConnection(	
			"jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
		pstmt = con.prepareStatement(select);
		pstmt.executeQuery();
	}catch(Exception e) {		
		e.printStackTrace();	
	}finally {		
		try {	
			con.close();
			pstmt.close();
		}catch(Exception e) {}	
	}		
			
				

%>
</table>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>