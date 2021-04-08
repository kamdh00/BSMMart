<%@ page language="java" contentType="text/html; charset=euc-kr" 
	pageEncoding="utf-8"%>
<%@ page import="model.MemberDAO"%>
<%@ page import="vo.MemberVO"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:useBean id="DBConn" class="conn.DBConn" scope="request"/>
<jsp:useBean id="mem" class="vo.MemberVO" scope="request"/>

<%
	String id=request.getParameter("id");
	if(id != null){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			conn=DBConn.getConnection();
			
			StringBuffer sql=new StringBuffer();
			sql.append("SELECT M_SSN, M_PWD, M_NO FROM MEMBER ");
			sql.append("WHERE M_ID=?");
			
			pstmt=conn.prepareStatement(sql.toString());
			
			pstmt.setString(1,id);			
			
			rs=pstmt.executeQuery();			
			if(rs.next()){
				MemberVO member=new MemberVO();
				member.setmSsn(rs.getString(1));
				member.setmPwd(rs.getString(2));
				member.setmNo(rs.getInt(3));
%>
	<script>
	alert('존재하는 아이디 입니다.');
	</script>
<%			
			}
			else{
				request.setAttribute("id",id);
%>
	<script>
	alert('사용가능한 아이디 입니다.');
	</script>
<%
			}			
		}
		catch(SQLException sqe){
			sqe.printStackTrace();
		}
		finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			catch(SQLException sqe){
				sqe.printStackTrace();
			}
		}
	}
%>	
<html>
<head>

<title>회원가입</title>
<script type="text/javascript">	
	// 아이디 존재 여부 체크
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
		if (document.join.name.value == "") {
			alert("이름을 입력하세요");
			return;
		}

		if (document.join.id.value == "") {
			alert("아이디를 입력하세요");
			return;
		}

		if (document.join.pwd.value == "") {
			alert("패스워드를 입력하세요");
			return;
		}

		if (document.join.pwd.value != document.join.repwd.value) {
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
			alert("휴대번화 번호를 입력하세요");
			return;
		}
				
		var count = 0;
		for (i = 0; i < document.join.agreement.length; i++) {
			if (document.join.agreement[i].checked == true) {
				count++;
			}
		}

		if (count == 0 || document.join.agreement[1].checked == true) {
			alert("회원가입 약관에 동의를 해주셔야 가입 절차가 진행됩니다.");
			return;
		}
		
		var name = document.join.name.value;
		var ssn = document.join.ssn.value;
		var id = document.join.id.value;
		var pwd = document.join.pwd.value;
		if(document.join.gender[0].checked == true){
			var gender = document.join.gender[0].value;	
		}
		else{
			var gender = document.join.gender[1].value;
		}		
		var email = document.join.mem_email1.value+ "@" + document.join.mem_email2.value;
		var address = document.join.address.value;
		var phone = document.join.phone1.value + document.join.phone2.value + document.join.phone3.value; 
		alert("회원가입이 완료되었습니다.");
		document.join.action = 
			"<%=request.getContextPath()%>/join.do?name="+name+"&ssn="+ssn+"&id="+id+"&pwd="+pwd+
					"&gender="+gender+"&email="+email+"&phone="+phone+"&address="+address;
		document.join.submit();
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
<form name="join" method="POST" action="<%=request.getContextPath()%>/joinForm.do">
<table align="center" cellspacing="0" cellpadding="0" width="1000" height="754">		
	<tr>
		<td width="672" height="414">		
		<input type="hidden" name="name" value="${ name }"/>
		<input type="hidden" name="ssn1" value="${ ssn1 }"/>
		<input type="hidden" name="ssn2" value="${ ssn3 }"/>
		<table width="527" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td colspan="2" align="center" width="527" bordercolor="white"
					bgcolor="green" height="50"><font size="5" color="white"><b>회 원 가 입</b></font></td>
			</tr>
			<%-- 이름과 주민번호는 먼저 확인후 존재하는 주민번호면 입력화면으로 입력값을 가지고 넘어오도록 함 --%>
			<tr>
				<td align="center" width="117" bordercolor="white" bgcolor="#33CC33" height="39">
				<p align="left"><b><font color="white">&nbsp;이 름</font></b></p>
				</td>
				<td width="410" height="39">&nbsp;${ name }				
				</td>
			</tr>
			<tr>
				<td align="center" width="117" bordercolor="white" bgcolor="#33CC33" height="39">
				<p align="left"><b><font color="white">&nbsp;주 민  번 호</font></b></p>
				</td>
				<td width="410" height="39">&nbsp;${ ssn1 }${ ssn2}</td>
			</tr>
			<tr>
				<td align="center" width="117" bordercolor="white" bgcolor="#33CC33" height="39">
				<p align="left"><b><font color="white">&nbsp;아 이 디</font></b></p>
				</td>
				<td width="410" height="39">&nbsp;<input type="text" value="${ id }" name="id" size="15" maxlength="15"/><input
					type="submit" value="ID 확인"></td>
					<%-- onclick="idCheck(this.form)" --%>
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
				<p align="left"><b><font color="white">&nbsp;재	확 인</font></b></p>
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
					name="gender" value="남" checked="checked">남 <input type="radio"
					name="gender" value="여">여</td>
			</tr>
			<tr>
				<td width="117" bordercolor="white" bgcolor="#33CC33" height="39">
				<p align="left"><b><font color="white">&nbsp;이 메 일</font></b></p>
				</td>
				<td height="39" class="style1" width="410">

				<p align="left">&nbsp;<input name="mem_email1" type="text"
					size="15">@<input name="mem_email2" type="text" size="15">
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
				<td width="410" height="39">&nbsp;<input type="text" name="address" size="50"/></td>
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
				 - <input name="phone2" type="text" size="4" maxlength="4"/> - <input name="phone3" type="text" size="4" maxlength="4"/>				
				</td>
			</tr>			
			<tr>
				<td width="527" height="50" align="center" colspan="2"
					bgcolor="white" bordercolor="white">&nbsp;</td>
			<tr>
				<td width="527" align="center" colspan="2" bgcolor="green"
					bordercolor="white" height="50">
				<p><b><font color="white"><span
					style="font-size: 18pt;">회 원 약 관</span></font></b></p>
				</td>
			<tr>
				<td width="527" align="center" colspan="2" bgcolor="white"
					bordercolor="white">
				<p>&nbsp;</p>
				<p><textarea name="회원 약관" rows="15" cols="69">제1조 [목적]

이 약관은 5조 주식회사 (이하 "회사")가 제공하는 S-MART 서비스 및 관련 제반 서비스(이하 "서비스")의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.


제2조 [정의]

이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
"아이디(ID)"라 함은 "회원"의 식별과 서비스 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.
"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.


제3조 [약관의 게시와 개정]

 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
 "약관의규제에관한법률", "정보통신망이용촉진및정보보호에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지합니다 . 

다만, 회원에게 불리한 내용으로 약관을 개정하는 경우에는 공지 외에 회원정보에 등록된 이메일 등 전자적 수단을 통해 별도로 명확히 통지하도록 합니다.
가 전항에 따라 공지하면서 회원에게 30일 기간 이내에 의사표시를 하지 않으면 승인한 것으로 본다는 뜻을 명확하게 공지하였음에도 회원이 명시적으로 거부의사를 밝히지 않은 경우에회원이 개정약관에 동의한 것으로 봅니다.
이 개정약관에 동의하지 않는 경우 회사는 개정약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용계약을 해지할 수 있습니다.


제4조 [약관의 해석]

회사는 개별 서비스에 대해서는 별도의 이용약관 및 정책("기타 약관 등"이라 함)을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "기타 약관 등"이 우선하여 적용됩니다.
이 약관에서 정하지 아니한 사항이나 해석에 대해서는 "기타 약관 등" 및 관계법령 또는 상관례에 따릅니다.


제5조 [이용계약 체결]

이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다.
"회사"는 "가입신청자"의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우
실명이 아니거나 타인의 명의를 이용한 경우
허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우
14세 미만 아동이 정보통신망 이용촉진 및 정보보호등에 관한 법률에서 정한 "개인정보" 입력 시 법정대리인(부모 등)의 동의를 얻지 아니한 경우
이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
"회원"이 유료서비스를 이용하는 경우 이용대금을 납부한 후 서비스를 이용하는 것을 원칙으로 하며, 유료서비스 이용계약의 성립시기는 "구매완료"를 신청절차 상에서 표시한 시점으로 합니다.
"회사"는 만 20세 미만의 미성년회원이 유료서비스를 이용하고자 하는 경우에 부모 등 법정대리인의 동의를 얻거나, 계약체결 후 추인을 얻지 않으면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있다는 내용을 계약체결 전에 고지하는 조치를 취합니다.
회사"는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
제2항과 제3항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 가입신청자에게 알리도록 합니다.
이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.
"회사"는 "회원"에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.


제6조 [회원정보의 변경]

개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 아이디 등은 수정이 불가능합니다.
회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "회사"에 대하여 그 변경사항을 알려야 합니다.
제2항의 변경사항을 "회사"에 알리지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.


제7조 [개인정보보호 의무]

"정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 "개인정보"를 보호하기 위해 노력합니다. "개인정보"의 보호 및 사용에 대해서는 관련법 및 "회사"의 개인정보 보호정책이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보보호정책이 적용되지 않습니다.


제8조 ["회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무]

"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.
"회사"는 회원의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 회사 및 회사의 운영자로 오인한 우려가 있는 경우, 해당 "아이디"의 

이용을 제한할 수 있습니다.
"회원"은 "아이디"및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다.
제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.
본 서비스는 오픈아이디를 지원하나 오픈아이디의 발급, 인증 서비스(ex:MyId, MyOpenId 등)업체가 제공 및 관리하는 "아이디","비밀번호" 인증 등과 관련된 부분에 대해서는 "회사"는 책임지지 않습니다.


제9조 ["회원"에 대한 통지]

"회사"가 "회원"에 대한 통지를 하는 경우 본 약관에 별도 규정이 없는 한 "회원"이 지정한 전자우편주소, 서비스 내 전자메모 및 쪽지 등으로 할 수 있습니다.
"회사"는 "회원" 전체에 대한 통지의 경우 7일 이상 "회사"의 게시판에 게시함으로써 제1항의 통지에 같습니다.</textarea></p>
				<input type="radio" name="agreement" value="true" />동의 <input
					type="radio" name="agreement" value="false" />동의하지 않음
				<p>&nbsp;</p>
				</td>
			<tr>
				<td colspan="2" align="center" width="527" bordercolor="white"
					bgcolor="#33CC33" height="40"><input type="button"
					value="회원가입" onclick="checking()" /> <input
					type="reset" value="다시작성" /></td>
			</tr>

		</table>
</table>	
	<input type="hidden" name="ssn" value="${ ssn }"/>
</form>
</body>
</html>