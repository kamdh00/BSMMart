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
<title>ȸ�� ���� ����</title>
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
				bgcolor="green" height="50"><font size="5" face="HY��B"
				color="white"><b>ȸ �� �� �� �� ��</b></font></td>
		</tr>
		<%-- �̸��� �ֹι�ȣ�� ���� Ȯ���� �����ϴ� �ֹι�ȣ�� �Է�ȭ������ �Է°��� ������ �Ѿ������ �� --%>
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33" height="39">
			<p align="left"><b><font color="white">&nbsp;�� ��</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;${ sessionScope.member.mName }</td>
		</tr>
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33" height="39">
			<p align="left"><b><font color="white">&nbsp;�� ��  �� ȣ</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;${ sessionScope.member.mSsn }</td>
		</tr>
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33" height="39">
			<p align="left"><b><font color="white">&nbsp;�� �� ��</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;${ sessionScope.member.mId }</td>
		</tr>		
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33"
				height="39">
			<p align="left"><b><font color="white">&nbsp;�� ��</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;${ sessionScope.member.mGender }</td>
		</tr>
		<tr>
			<td width="117" bordercolor="white" bgcolor="#33CC33" height="39">
			<p align="left"><b><font color="white">&nbsp;�� �� ��</font></b></p>
			</td>
			<td height="39" width="410"><p align="left">&nbsp;${ sessionScope.member.mEmail }</p></td>
		</tr>			
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33"
				height="39">
			<p align="left"><b><font color="white">&nbsp;�� ��</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;${ sessionScope.member.mAddress }</td>
		</tr>
		<tr>
			<td align="center" width="117" bordercolor="white" bgcolor="#33CC33"
				height="39">
			<p align="left"><b><font color="white">&nbsp;�� �� ��</font></b></p>
			</td>
			<td width="410" height="39">&nbsp;${ sessionScope.member.mPhone }</td>
		</tr>			
		<tr>
			<td width="527" height="50" align="center" colspan="2"
				bgcolor="white" bordercolor="white">&nbsp;</td>

		<tr>
			<td colspan="2" align="center" width="527" bordercolor="white"
				bgcolor="#33CC33" height="40"><input type="submit"
				value="ȸ����������"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center" width="527" bordercolor="white"
				bgcolor="#33CC33" height="40"><br/><input type="button"
				value="ȸ��Ż��" onclick="dropMember()"/></td>
		</tr>
	</table>
</form>
</body>
</html>