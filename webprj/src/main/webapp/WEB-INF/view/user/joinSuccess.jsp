<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import="model.MemberDAO"%>
<%@ page import="vo.MemberVO"%>
<%@ page import="controller.JoinCommand"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ȸ�� ���� �Ϸ�</title>

</head>
<body>
<form name="join" method="POST" enctype="multipart/form-data" action="<%=request.getContextPath()%>/templete.jsp?content=user/login">
<table align="center" cellspacing="0" cellpadding="0" width="1000">	
	<tr>		
		<td width="672" height="414">
		<table width="527" cellspacing="0" align="center" height="426"
			cellpadding="0">
			<tr>
				<td colspan="2" align="center" width="527" bordercolor="white"
					bgcolor="green" height="50"><font size="5" 
					color="white"><b>ȸ ��&nbsp;�� �� &nbsp;�� ��</b></font></td>
			</tr>
			<tr>
				<td align="center" width="117" bordercolor="white" bgcolor="#33CC33"
					height="55">
				<p align="left"><b><font  color="white">&nbsp;�� ��</font></b></p>
				</td>
				<td width="410" height="55">&nbsp;&nbsp;${member.mName}</td>
			</tr>
			<tr>
				<td width="117" height="55" align="center" bgcolor="#33CC33"
					bordercolor="white">
				<p align="left"><b><font  color="white">&nbsp;�� �� ��</font></b></p>
				</td>
				<td width="410" height="55">&nbsp;&nbsp;${member.mId}</td>
			</tr>
			<tr>
				<td width="117" height="55" align="center" bgcolor="#33CC33"
					bordercolor="white">
				<p align="left"><b><font  color="white">&nbsp;�� ȭ �� ȣ</font></b></p>
				</td>
				<td width="410" height="55">&nbsp;&nbsp;${member.mPhone}</td>
			</tr>
			<tr>
				<td width="117" height="55" align="center" bgcolor="#33CC33"
					bordercolor="white">
				<p align="left"><b><font  color="white">&nbsp;�� ��</font></b></p>
				</td>
				<td width="410" height="55">&nbsp;&nbsp;${member.mAddress}</td>
			</tr>
			<tr>
				<td align="center" width="117" bordercolor="white" bgcolor="#33CC33"
					height="55">
				<p align="left"><b><font  color="white">&nbsp;�� �� ��</font></b></p>
				</td>
				<td width="410" height="55">
				<p>&nbsp;&nbsp;${member.mEmail}</p>
				</td>
			</tr>			
			<tr>
				<td width="527" height="50" align="center" colspan="2"
					bgcolor="white" bordercolor="white">
				<p>&nbsp;</p>
				</td>
			<tr>
				<td colspan="2" align="center" width="527" bordercolor="white"
					bgcolor="green" height="40">
				<p><input type="submit" value="Ȯ ��" /></p>
				</td>
			</tr>

		</table>
		</td>		
	</tr>		
</table>

</form>
</body>
</html>
