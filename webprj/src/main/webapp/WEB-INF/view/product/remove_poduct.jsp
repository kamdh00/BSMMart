<%-- remove_product.jsp --%>
<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
	<head>
		<title>상품 삭제</title>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/removeProduct.do" method="post">
			<table>
				<tr>
					<td>상품 번호:</td>
					<td><input type="text" name="pNo"></td>
				</tr>
				<tr>
					<td><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</body>
</html>