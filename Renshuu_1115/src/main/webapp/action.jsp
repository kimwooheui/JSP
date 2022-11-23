<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.*,java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String STUID = request.getParameter("STUID");
String SUBCODE = request.getParameter("SUBCODE");
Integer MIDSCORE = (int)Integer.parseInt(request.getParameter("MIDSCORE"));
Integer FINALSCORE = (int)Integer.parseInt(request.getParameter("FINALSCORE"));
Integer ATTEND = (int)Integer.parseInt(request.getParameter("ATTEND"));
Integer REPORT = (int)Integer.parseInt(request.getParameter("REPORT"));
Integer ETC = (int)Integer.parseInt(request.getParameter("ETC"));
boolean result = false;
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","hr","hr");
	String insert = "insert into TBL_SCORE_202210 values(?,?,?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(insert);
	
	pstmt.setString(1,STUID);
	pstmt.setString(2,SUBCODE);
	pstmt.setInt(3,MIDSCORE);
	pstmt.setInt(4,FINALSCORE);
	pstmt.setInt(5,ATTEND);
	pstmt.setInt(6,REPORT);
	pstmt.setInt(7,ETC);
	
	pstmt.executeUpdate();
	result = true;
	conn.close();
	pstmt.close();
	
}catch(Exception e){
	e.printStackTrace();
}
if(result){
	%>
	<script type="text/javascript">
	alert("수강신청이 정상적으로 완료되었습니다!");
	location = "index.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("수강신청 실패! \n 메인화면으로 이동합니다");
	location = "index.jsp";
	</script>
	<%
}
%>

</body>
</html>