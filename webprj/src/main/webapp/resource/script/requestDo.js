//============= .do �� �̵� ===========================
/*
 addCart() : ��ٱ��Ϸ� �̵�
 buyProduct() : ���ŷ� �̵�
 */
function addCart() {
	var pNo = document.form.pNo.value;
	var quantity = document.form.quantity.value;
	location.href = "<%=request.getContextPath()%>/addCart.do?pNo=" + pNo
			+ "&quantity=" + quantity;
}
function buyProduct(form) {
	form.action = "<%=request.getContextPath()%>/buyProduct.do";
	form.submit();
}