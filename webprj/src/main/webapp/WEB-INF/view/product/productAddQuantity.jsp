<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<html>
	<head>
		<title>��� �߰�</title>
		<script type="text/javascript">
			function addQuantity(){
				window.close();
				document.pwdForm.submit();
				
				window.opener.location.href="<%=request.getContextPath()%>/detailProduct.do?pNo=";
			}
			
			function cancel(){
				window.close();
			}
		</script>
	</head>
	<body>
	<form name="addForm" action="${pageContext.request.contextPath}/addProductQuantityBoard.do" method="POST">
	<table border="1" align="center">
		<tr>
			<td colspan="2">�߰� �� ����� �Է��Ͻÿ�</td>
		</tr>
		<tr>
			<td>�߰� �� ��� : </td>
			<td><input type="text" name="addQuantity" size="10" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="�߰�" onclick="addQuantity()">&nbsp;
				<input type="reset" value="���" onclick="cancel()">
			</td>
		</tr>
	</table>
	<input type="hidden" name="no" value="${param.no}"/>
	</form>
	</body>
</html>