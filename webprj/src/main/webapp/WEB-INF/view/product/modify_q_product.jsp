<%-- modify_product.jsp --%>
<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
	<head>
		<title>��ǰ ���� ����</title>
		<link href="../css/default.css" rel="stylesheet" type="text/css" />	
		<link href="../css/modifyQProduct.css" rel="stylesheet" type="text/css" />
	</head>
	<body>		
		<%-- content �κ�--%>
		<div id="add_product"  align="center">
			<form action="<%=request.getContextPath()%>/modifyQProduct.do" method="post">
				<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td width="90" align="center">��ǰ ��ȣ</td>
						<td>
							<input type="text" name="pNo">
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
							<input type="submit" value="��ǰ ���� ����">
							<input type="reset" value="�ٽ� �ۼ�">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<%-- content �κ� ��--%>
	</body>
</html>