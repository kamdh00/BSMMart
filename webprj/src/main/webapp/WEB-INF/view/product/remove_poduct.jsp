<%-- remove_product.jsp --%>
<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
	<head>
		<title>��ǰ ����</title>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/removeProduct.do" method="post">
			<table>
				<tr>
					<td>��ǰ ��ȣ:</td>
					<td><input type="text" name="pNo"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Ȯ��"></td>
				</tr>
			</table>
		</form>
	</body>
</html>