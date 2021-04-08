<%-- modify_product.jsp --%>
<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
	<head>
		<title>상품 정보 수정</title>
		<link href="../css/default.css" rel="stylesheet" type="text/css" />	
		<link href="../css/modifyQProduct.css" rel="stylesheet" type="text/css" />
	</head>
	<body>		
		<%-- content 부분--%>
		<div id="add_product"  align="center">
			<form action="<%=request.getContextPath()%>/modifyQProduct.do" method="post">
				<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td width="90" align="center">상품 번호</td>
						<td>
							<input type="text" name="pNo">
						</td>
					</tr>
					<tr>
						<td width="90" align="center">상품 수량</td>
						<td width="310">
							<input type="text" name="pQuantity">
						</td>
					</tr>					
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="상품 수량 수정">
							<input type="reset" value="다시 작성">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<%-- content 부분 끝--%>
	</body>
</html>