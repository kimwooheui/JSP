<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>

	<div class="title">회원정보조회</div>
	<div class="wrapper">
	<table style="width: 700px;">
		<tr>
			<th>수강월</th>
			<th>회원번호</th>
			<th>회원명</th>
			<th>강의명</th>
			<th>강의장소</th>
			<th>수강료</th>
			<th>등급</th>
		</tr>
		<%
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection
			                 ("jdbc:oracle:thin:@//localhost:1521/xe","hr","hr");
			
			
			String sql = "select "
						+"substr(c.REGIST_MONTH,1,4)||'년'||substr(c.REGIST_MONTH,5,2)||'월' as regimonth, "
						+"c.C_NO, "
						+"m.C_NAME, "
						+"t.CLASS_NAME, "
						+"c.CLASS_AREA, "
						+"to_char(c.TUITION,'L999,999,999') as TUITION_won, "
						+"m.GRADE "
						+"from TBL_CLASS_202201 c, TBL_MEMBER_202201 m, TBL_TEACHER_202201 t "
						+"where t.CLASS_PRICE = c.TUITION "
						+"and m.C_NO = c.C_NO ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			       
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
		</tr>
		<%}
			con.close();
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		%>		
		
	</table>
	</div>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>