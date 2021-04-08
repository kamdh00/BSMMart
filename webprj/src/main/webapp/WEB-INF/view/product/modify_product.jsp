<%-- modify_product.jsp --%>
<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
	<head>
		<title>상품 정보 수정</title>
		<link href="../css/default.css" rel="stylesheet" type="text/css" />
  		<link href="../css/modifyProduct.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<%-- content 부분--%>
		<div id="add_product"  align="center">
			<form action="<%=request.getContextPath()%>/modifyProduct.do" method="post">
				<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td width="90" align="center">상품 번호</td>
						<td>
							<input type="text" name="pNo">
						</td>
					</tr>
					<tr>
						<td width="90" align="center">상품 분류</td>
						<td width="310">
							<select name="cNo">								
								<option value="1" >가공즉석식품</option>
								<option value="2" >음료/커피/과자</option>
								<option value="3" >생활용품</option>
							</select>
						</td>
					</tr>
					<tr>
						<td width="90" align="center">상품명</td>
						<td width="310">
							<input type="text" name="pName">
						</td>
					</tr>
					<tr>
						<td width="90" align="center">회사명</td>
						<td width="310">
							<input type="text" name="pCompany">
						</td>
					</tr>
					<tr>
						<td width="90" align="center">상품 가격</td>
						<td width="310">
							<input type="text" name="pPrice">
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
							<input type="submit" value="상품 수정">
							<input type="reset" value="다시 작성">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<%-- content 부분 끝--%>
	</body>
</html>