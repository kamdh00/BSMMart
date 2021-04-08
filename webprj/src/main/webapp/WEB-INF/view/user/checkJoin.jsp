<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import="model.MemberDAO"%>
<%@ page import="vo.MemberVO"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<html>
<head>
<title>회원 정보 수정</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function dropMember(){
		var url="<%=request.getContextPath()%>/user/idCheck.jsp";
		
		window.open(url, "", "width=300, height=250");
	}	
</script>
</head>

<body>
<form name="join" method="POST" action="<%=request.getContextPath()%>/templete.jsp?content=user/modifyJoin">
	<table width="527" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td colspan="2" align="center" width="527" bordercolor="white"
				bgcolor="green" height="50"><font size="5" face="HY강B"
				color="white"><b>회 원 정 보 수 정</b></font></td>
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
			<p align="left"><b><font color="white">&nbsp;주 민  번 호</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;${ sessionScope.member.mSsn }</td>
		</tr>
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33" height="39">
			<p align="left"><b><font color="white">&nbsp;아 이 디</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;${ sessionScope.member.mId }</td>
		</tr>		
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33"
				height="39">
			<p align="left"><b><font color="white">&nbsp;성 별</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;${ sessionScope.member.mGender }</td>
		</tr>
		<tr>
			<td width="117" bordercolor="white" bgcolor="#33CC33" height="39">
			<p align="left"><b><font color="white">&nbsp;이 메 일</font></b></p>
			</td>
			<td height="39" width="410"><p align="left">&nbsp;${ sessionScope.member.mEmail }</p></td>
		</tr>			
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33"
				height="39">
			<p align="left"><b><font color="white">&nbsp;주 소</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;${ sessionScope.member.mAddress }</td>
		</tr>
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33"
				height="39">
			<p align="left"><b><font color="white">&nbsp;휴 대 폰</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;${ sessionScope.member.mPhone }</td>
		</tr>			
		<tr>
			<td width="527" height="50" align="center" colspan="2"
				bgcolor="white" bordercolor="white">&nbsp;</td>

		<tr>
			<td colspan="2" align="center" width="527" bordercolor="white"
				bgcolor="#33CC33" height="40"><input type="submit"
				value="회원정보수정"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center" width="527" bordercolor="white"
				bgcolor="#33CC33" height="40"><br/><input type="button"
				value="회원탈퇴" onclick="dropMember()"/></td>
		</tr>
	</table>
</form>
</body>
</html>