<%-- modify_product.jsp --%>
<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
	<head>
		<title>��ǰ ���� ����</title>
		<link href="../css/default.css" rel="stylesheet" type="text/css" />
  		<link href="../css/modifyProduct.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<%-- content �κ�--%>
		<div id="add_product"  align="center">
			<form action="<%=request.getContextPath()%>/modifyProduct.do" method="post">
				<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td width="90" align="center">��ǰ ��ȣ</td>
						<td>
							<input type="text" name="pNo">
						</td>
					</tr>
					<tr>
						<td width="90" align="center">��ǰ �з�</td>
						<td width="310">
							<select name="cNo">								
								<option value="1" >�����Ｎ��ǰ</option>
								<option value="2" >����/Ŀ��/����</option>
								<option value="3" >��Ȱ��ǰ</option>
							</select>
						</td>
					</tr>
					<tr>
						<td width="90" align="center">��ǰ��</td>
						<td width="310">
							<input type="text" name="pName">
						</td>
					</tr>
					<tr>
						<td width="90" align="center">ȸ���</td>
						<td width="310">
							<input type="text" name="pCompany">
						</td>
					</tr>
					<tr>
						<td width="90" align="center">��ǰ ����</td>
						<td width="310">
							<input type="text" name="pPrice">
						</td>
					</tr>
					<tr>
						<td width="90" align="center">��ǰ ����</td>
						<td width="310">
							<input type="text" name="pQuantity">
						</td>
					</tr>					
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="��ǰ ����">
							<input type="reset" value="�ٽ� �ۼ�">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<%-- content �κ� ��--%>
	</body>
</html>