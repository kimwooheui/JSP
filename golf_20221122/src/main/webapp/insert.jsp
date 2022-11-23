<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<script src="script.js"></script>
</head>
<body onload="document.frm.regist_month.focus();">
<%@ include file="topmenu.jsp" %>
<section>
<form name="frm" action="action.jsp" method="post">
	<div class="title">수강신청</div>
	<div class="wrapper">
	<table class="insertBox" style="width: 600px;">
	<colgroup>
	<col width="30%;">
	<col width="70%;">
	</colgroup>
		<tr>
			<th>수강월</th>
			<td>
			<input type="text" name="regist_month" maxlength="6">
			2022년03월 예)202203
			</td>
		</tr>
		<tr>
			<th>회원명</th>
			<td>
			<select name="c_name" onchange="fn_change1();">
			<option value="">회원명</option>
			<option value="10001">홍길동</option>			
			<option value="10002">장발장</option>			
			<option value="10003">임꺽정</option>			
			<option value="20001">성춘향</option>			
			<option value="20002">이몽룡</option>			
			</select>		
			
			</td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td><input type="text" name="c_no" readonly>예)10001</td> 
		</tr>
		<tr>
			<th>강의장소</th>
			<td>
			<select name="class_area">
			<option value="">강의장소</option>
			<option value="서울본원">서울본원</option>
			<option value="성남분원">성남분원</option>
			<option value="대전분원">대전분원</option>
			<option value="부산분원">부산분원</option>
			<option value="대구분원">대구분원</option>
			
			</select>
			</td>
		</tr>
		<tr>
			<th>강의명</th>
			<td>
			<select name="teacher_code" onchange="fn_change2();">
			<option value="">강의신청</option>
			<option value="100">초급반</option>
			<option value="200">중급반</option>
			<option value="300">고급반</option>
			<option value="400">심화반</option>
			
			</select>
			</td>
		</tr>
		<tr>
			<th>수강료</th>
			<td><input type="text" name="tuition" readonly>원</td>
		</tr>
		<tr>
			<td style="text-align:center;" colspan="2">
			<button class="btn" type="submit" onclick="returnfn_submit();">수강신청</button>
			<button class="btn" type="button" onclick="fn_reset();" >다시쓰기</button>
			</td>			
		</tr>		
	</table>
	</div>
</form>
</section>
<%@ include file="footer.jsp" %>
<script type="text/javascript">
function fn_submit(){
	var fn = document.frm;
	
	if(fn.regist_month.value === ""){
		alert("수강월을 입력해주세요!");
		fn.regist_month.focus();
		return false;
	}
	else if(fn.c_no.value === ""){
		alert("회원명을 선택해주세요!");
		fn.c_name.focus();
		return false;
	}
	else if(fn.class_area.value === ""){
		alert("강의장소를 선택해주세요!");
		fn.class_area.focus();
		return false;
	}
	else if(fn.tuition.value === ""){
		alert("강의명을 선택해주세요!");
		fn.teacher_code.focus();
		return false;
	}
	else{
		return true;
	}
	
	
}
function fn_reset(){
	
	if(confirm("정보를 지우고 처음부터 다시 입력합니다!")){
		location="insert.jsp";
	}
}
function fn_change1(){ //회원명 셀렉트박스
	var fn = document.frm;
	
	/* 중 요 */
	fn.tuition.value = ""; //회원별 할인률을 적용해야하므로 수강료 초기화
	fn.teacher_code.options[0].selected = true; //셀렉트박스 초기화
	
	
	fn.c_no.value = fn.c_name.value; //회원번호 넣어주기
	
}
function fn_change2(){ //강의신청 셀렉트박스
	var fn = document.frm;
	var price = fn.teacher_code.value * 1000; //수강료
	var c_no = fn.c_no.value; // 회원번호 20000이상 50%할인
	
	if(c_no >= 20000) price *= 0.5; //50% 할인
	
	fn.tuition.value = price; //수강료 넣어주기
}
</script>
</body>
</html>