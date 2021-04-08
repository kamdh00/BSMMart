//============= .do 로 이동 ===========================
/*
 addCart() : 장바구니로 이동
 buyProduct() : 구매로 이동
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