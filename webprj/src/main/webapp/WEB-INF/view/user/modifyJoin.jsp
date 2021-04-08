<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import="model.MemberDAO"%>
<%@ page import="vo.MemberVO"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<html>
<head>
<title>회원 정보 수정</title>
<script type="text/javascript">	
	//아이디 존재 여부 체크
	function idCheck(form){
		var id=form.id.value;
		var na=form.na.value;
		var ssn1=form.ssn1.value;
		var ssn2=form.ssn2.value;		
		var url="<%=request.getContextPath()%>/idCheck.do?id="+id+"&na="+na+"&ssn1="+ssn1+"&ssn2="+ssn2;
		
		window.open(url, "", "width=300, height=250");
		return id;
	}
	
	function checking() {		
		if (document.join.pwd.value == "") {
			alert("패스워드를 입력하세요");
			return;
		}
	
		if (document.join.pwd.value != document.join.repwd.value) {
			alert("패스워드가 틀립니다");
			return;
		}
		
		if (document.join.pwd.value != document.join.password.value){
		   alert("패스워드가 틀립니다");
		   return;
		  }
	
		if (document.join.mem_email1.value == "" || document.join.mem_email2.value == ""){
			alert("이메일 주소를 입력하세요");
			return;
		}
		
		if (document.join.address.value == ""){
			alert("주소를 입력하세요");
			return;
		}
		
		if (isNaN(document.join.phone1.value) || isNaN(document.join.phone2.value) || isNaN(document.join.phone3.value)){			
			alert("숫자만 입력하세요");
			document.join.phone2.value="";
			document.join.phone3.value="";
			return;
		}
		
		if (document.join.phone1.value == "" || document.join.phone2.value == "" || document.join.phone3.value == ""){
			alert("휴대전화번화 번호를 입력하세요");
			return;
		}
				
		alert("회원정보 수정이 완료되었습니다.");
		document.join.submit();
		document.join.action = 
			"<%=request.getContextPath()%>/index.jsp";		
	}
	
	function cancel() {
		document.join.action = 
			"<%=request.getContextPath()%>/templete.jsp?content=checkJoin";
	}
	
	function fnc_DomainCheck(obj) {
		if (obj.value == "etc") {
			document.join.mem_email2.value = ""; //fregisterform은 form문의 name값으로 변경해야 합니다.
			document.join.mem_email2.focus();
		} else {
			document.join.mem_email2.value = document.join.mem_email3.value;
		}
	}	
	function pwdCheck() {
		if (document.join.pwd.value != document.join.repwd.value) {
			alert("패스워드가 다릅니다. 다시 확인 해 주세요");
		} else {
			alert("패스워드가 일치합니다.");
		}
	}
</script>
</head>

<body>
<form name="join" method="POST" action="<%=request.getContextPath()%>/modifyJoin.do">
	<input type="hidden" name="password" value="${sessionScope.member.mPwd }"/>
	<table width="527" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td colspan="2" align="center" width="527" bordercolor="white"
				bgcolor="green" height="50"><font size="5" color="white"><b>회 원 정 보 수 정</b></font></td>
		</tr>
		<%-- 이름과 주민번호는 먼저 확인후 존재하는 주민번호면 입력화면으로 입력값을 가지고 넘어오도록 함 --%>
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33" height="39">
			<p align="left"><b><font color="white">&nbsp;이 름</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;${ sessionScope.member.mName }</td>
		</tr>		
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33" height="39">
			<p align="left"><b><font color="white">&nbsp;아 이 디</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;${ sessionScope.member.mId }</td>
		</tr>
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33" height="39">
			<p align="left"><b><font color="white">&nbsp;비 밀 번 호</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;<input type="password"
				name="pwd" size="15" maxlength="15"/></td>
		</tr>
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33" height="39">
			<p align="left"><b><font color="white">&nbsp;재 확 인</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;<input type="password"
				name="repwd" size="15" maxlength="15"/><input type="button" value="비밀번호 확인"
				onclick="pwdCheck()"></td>
		</tr>
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33"
				height="39">
			<p align="left"><b><font color="white">&nbsp;성 별</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;<input type="radio"
				name="gender" value="남">남 <input type="radio"
				name="gender" value="여">여</td>
		</tr>
		<tr>
			<td width="117" bordercolor="white" bgcolor="#33CC33" height="39">
			<p align="left"><b><font color="white">&nbsp;이 메 일</font></b></p>
			</td>
			<td height="39" class="style1" width="410">

			<p align="left">&nbsp;<input name="mem_email1" type="text"
				size="15"/>@<input name="mem_email2" type="text" size="15"/>
			<select name="mem_email3" size="1" class="style1" id="select"
				onChange="fnc_DomainCheck(this)">
				<option value="0">선택하세요</option>
				<option value="">직접입력</option>
				<option value="paran.com">paran.com</option>
				<option value="chollian.net">chollian.net</option>
				<option value="empal.com">empal.com</option>
				<option value="freechal.com">freechal.com</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="lycos.co.kr">lycos.co.kr</option>
				<option value="korea.com">korea.com</option>
				<option value="nate.com">nate.com</option>
				<option value="naver.com">naver.com</option>
				<option value="netian.com">netian.com</option>
				<option value="unitel.co.kr">unitel.co.kr</option>
				<option value="yahoo.co.kr">yahoo.co.kr</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="daum.net">daum.net</option>
				<option value="google.com">google.com</option>
			</select></p>
			</td>
		</tr>			
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33"
				height="39">
			<p align="left"><b><font color="white">&nbsp;주 소</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;<input type="text" name="address" size="50" value="${ sessionScope.member.mAddress }"/></td>
		</tr>
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33"
				height="39">
			<p align="left"><b><font color="white">&nbsp;휴 대 폰</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;
			<select name="phone1" size="1" class="style1" id="select">
				<option value="0">선택</option>					
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>
			 - <input name="phone2" type="text" size="4" maxlength="4"/>
			  - <input name="phone3" type="text" size="4" maxlength="4"/>				
			</td>
		</tr>			
		<tr>
			<td width="527" height="50" align="center" colspan="2"
				bgcolor="white" bordercolor="white">&nbsp;</td>

		<tr>
			<td colspan="2" align="center" width="527" bordercolor="white"
				bgcolor="#33CC33" height="40"><input type="button"
				value="수정" onclick="checking()" /> <input
				type="button" value="취소" onclick="cancel()" /></td>
		</tr>		
	</table>
</form>
</body>
</html>