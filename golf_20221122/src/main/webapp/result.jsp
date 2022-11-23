<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사매출현황</title>
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>

	<div class="title">강사매출현황</div>
	<div class="wrapper">
	<table style="width: 500px;">
		<tr>
			<th>강사코드</th>
			<th>강의명</th>
			<th>강사명</th>
			<th>총매출</th>
		</tr>
		<%
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection
			                 ("jdbc:oracle:thin:@//localhost:1521/xe","hr","hr");
			
			String sql = "select "
					+"t.TEACHER_CODE, "
					+"t.CLASS_NAME, "
					+"t.CLASS_NAME, "
					+"to_char(sum(c.TUITION),'L999,999,999') as TUITION_won "
					+"from TBL_CLASS_202201 c, TBL_TEACHER_202201 t "
					+"where t.CLASS_PRICE = c.TUITION "
					+"group by(t.TEACHER_CODE, "
					+"t.CLASS_NAME, "
					+"t.CLASS_NAME) "
					+"order by t.TEACHER_CODE ";
			       
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td style="text-align:right;"><%=rs.getString(3) %></td>
			<td style="text-align:right;"><%=rs.getString(4) %></td>
		</tr>
		<%} 
			con.close();
			pstmt.close();
			
		}catch(Exception e){
			
		}
		%>		
	</table>
	</div>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>