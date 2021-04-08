<%-- S-mart index.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>

<!-- <html> -->
 <head>
  <title>S-MART</title>
  <style type="text/css">
  	/* body{margin:0; padding:0; font-family:돋움,sans-serif; font-size:small;}
  	div,p{margin:0; padding:0;}  	
  	ul{margin:0; padding:0; list-style:none;}
  	a{text-decoration:none;}
  	img{border:none;}   */
  	#wrap{width:100%;}
  	/* #header{width:800px;} */
  	#logo{float:left; margin-top:10px;}
  	#search{float:left; margin-top: 38px; margin-left:10px;}
  	#client_form{float:left; margin-top:45px; margin-left:10px;}
  	#client_form ul li{float:left;}
  	/* #nav{width:100%; background-image: url(img/menubar_bg.gif); background-repeat: repeat-x; position:relative;}
  	#nav_center{width:798px;}
	#nav1, #nav2, #nav3, #nav4, #nav5{float:left;} */
	
	#content{width:100%;}
	#details{margin-top: 30px;}
	#product_detail{width:900px; height:380px;}
	#product_detail_img{width:380px; height:380px; background-color:#CCCBB5}
	#img_center{padding:15px; width:350px; height:350px;}
	#product_name{font-size:30px; font-weight:bold;}
	.product_d{font-size:15px; font-weight:bold; color:#787878}
	#total_price{width:450px; padding:5px; margin:5px; font-size:18px; font-weight:bold; background:#CCCBB5; border:solid 1px #787878;}
	.p_line{border-bottom:dotted 2px #787878;}
	#cart_button{padding-top:15px;}
	#detailcut{padding-top:30px; padding-bottom:30px;}
		
	/* #footer_wrap{width:100%; height:50px; background-image: url("img/footer_bg.gif"); background-repeat: repeat-x;}
  	#footer{width:798px;}
  	#footer img{float:left; margin-top:5px;}
  	#footer p{float:left; margin-top:7px; margin-left:10px; font-family:돋움,sans-serif; font-size:12px; color:white; } */
  	
  </style>
  <script type="text/javascript">	
  	function swapImage() {
	var arr=new Array();
	document.oImg=new Array();
	arr=swapImage.arguments;
	var arrCnt=arr.length;
		for(var i=0;i<arrCnt;i+=2) {
			var tImg=document.getElementById(arr[i]);
			document.oImg[i]=arr[i];
			document.oImg[i+1]=tImg.src;
			tImg.setAttribute("src",arr[i+1]);
		}
	}
	function restoreImage() {
		if(document.oImg) {
			var oImgCnt=document.oImg.length;
			for(var i=0;i<oImgCnt;i+=2) {
				var tImg=document.getElementById(document.oImg[i]);
				tImg.setAttribute("src",document.oImg[i+1]);
			}
		}
	}
	
	function addCart(){
		var pQuantity=document.form.pQuantity.value;
		if(pQuantity == 0){
			alert("재고수량이 없습니다.");
			return;
		}
		var pNo=document.form.pNo.value;
		var quantity=document.form.quantity.value;
		location.href="<%=request.getContextPath()%>/addCart.do?pNo="+pNo+"&quantity="+quantity;		
	}
	
	function addQuantity(){
		var boardNo=form.no.value;
		var url="<%=request.getContextPath()%>/product/productAddQuantity.jsp?no=" + pNo;

		window.open(url, "", "width=300, height=250");
	}
	
	function buyProduct(form){
		form.action="<%=request.getContextPath()%>/buyProduct.do";
		form.submit();
	}
	
	function totalProductCal(){
		var price=document.form.price.value;
		var quantity=document.form.quantity.value;
		var total=price*quantity;
		var orderPrice=document.getElementById("orderPrice");
		orderPrice.innerHTML=total;
		
	}	
	function numCheck(value, qu) {
		if (value > qu) {
			alert("한정수량을 초과하였습니다.");
			document.form.quantity.value = qu;
		} else if (value < 2) {
			document.form.quantity.value = 1;
		}		
	}		
	function up(value, qu) {
		if (value > qu - 1) {
			alert("한정수량을 초과하였습니다.");
			document.form.quantity.value = qu;
		} else {
			document.form.quantity.value = (value/1) + 1;
		}
		totalProductCal();
	}		
	function down(value) {
		if (value < 2) {
			document.form.quantity.value = 1;
		} else {
			document.form.quantity.value = value - 1;
		}
		totalProductCal();
	}
	
	function buy(){
		alert("기능 추가 중 입니다.");
	}
  </script>	
</head>
	<body onload="totalProductCal()">	
		<%-- content 부분--%>
		<div id="content"  align="center">
			<div id="details">
				<table id="product_detail">
				  <tr>
				    <td id="product_detail_img" rowspan="6">
				        <div id="img_center">
				          <img src="${product.pImgUrl}" width="350" height="350" alt="상세이미지" />
				        </div>
				    </td>
				    <td rowspan="6" width="10px"></td>				      
				     <td class=p_line" style="vertical-align: top;">
				     	<span id="product_name">상품명 : ${requestScope.product.pName}</span><br/><br/><br/><br/>
				     	<span class="product_d" style="vertical-align: middle;">제조사/브랜드 : ${ requestScope.product.pCompany }</span><br/>
				     	<span class="product_d">단가 : <font style="color:#39F"> ${ requestScope.product.pPrice }원</font></span><br/>
				    	<span class="product_d">재고수량 : <font style="color:#39F">${ requestScope.product.pQuantity }개</font></span>
				     	<%-- <p id=product_name>상품명 : ${requestScope.product.pName}</p><br/>
				      	<p class=product_d>제조사/브랜드 : ${ requestScope.product.pCompany }</p><br/>
				    	<p class=product_d>단가 : <font style="color:#39F"> ${ requestScope.product.pPrice }원</font></p><br/>
				    	<p class=product_d>재고수량 : <font style="color:#39F">${ requestScope.product.pQuantity }개</font></p><br/> --%>
				    </td>
				    
				  </tr>
				  
				  <tr>				    
				    <form name="form">
				      <table>
				        <tr>
				          <td style="vertical-align: middle;">&nbsp;&nbsp;수량 : <input type="text" name="quantity" size="2" value="1" maxlength="2" style="width:28px;" 
				          onblur="numCheck(this.form.quantity.value, '${requestScope.product.pQuantity}')" onkeyup="if(isNaN(this.value)){alert('숫자만 입력해 주세요.'); this.value='1';}else if(this.value>10){}else{return this.value;}" /></td>
				          <td><input type="button" name="plus" value="▲"  onclick="up(this.form.quantity.value, '${requestScope.product.pQuantity}')" 
				          style="background-color: white; border: 0; height: 10px; font-size: 9px;" /><br/>
				          <input type="button" name="minus" value="▼" onclick="down(this.form.quantity.value)" 
				          style="background-color: white; border: 0; height: 10px; font-size: 9px" />
				          </td>
				        </tr>
				      </table> 
				       <input type="hidden" name="pNo" value="${ requestScope.product.pNo }"/>
				       <input type="hidden" name="price" value="${ requestScope.product.pPrice }"/>
				       <input type="hidden" name="pQuantity" value="${ requestScope.product.pQuantity }"/>
				      </form>   
				    </td>
				  </tr>
				  <tr>
				    <td class="p_line">
				    	<table id=total_price><tr>
				    	<td style="width:100px; padding:15px 5px;">&nbsp;&nbsp;구매가 :</td>
				    	<td style="vertical-align: middle;"><div id="orderPrice" style="float:right; color=red; width:80px; font-size:30px;"></div></td>
				    	<td style="width:100px">원</td><td style="width:100px"></td>
				    	</tr>
				    	</table>
				    </td>
				  </tr>
				  <tr>
				    <td align="center">
<% 	
	String login = (String) session.getAttribute("loginId");
	if(login != null){
%>
				    <div id="cart_button">
					<a href="javascript:addCart()">
					    <img src="<%=request.getContextPath()%>/img/btn_shoppingcart_big.gif" 
					    width="137" height="48" alt="장바구니담기" style="cursor:pointer; margin-left:5px"/>
				    </a>
				    <a href="javascript:buy()">
				    &nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=request.getContextPath()%>/img/btn_buynow_big.gif" 
				    width="133" height="48" alt="바로구매" style="cursor:pointer"/>
				    </a>
				    </div>
<%} %>
<%-- <%
	}
	AdminVO admin = (AdminVO)session.getAttribute("admin");
	if(admin != null){
%>
					<div id="cart_button">
					<a href="javascript:addQuantity()">
						재고 추가
				    </a>
				     </div>
<%
	}
%>	 --%>			     
				    </td>
				  </tr>
				  <tr>
				    <td>&nbsp;</td>
				  </tr>
				</table>

			</div>	
			<div id="detailcut">
				<c:set var="v" value="${ fn:split(product.pDetail, '@@') }" />
				<c:forEach var="item" items="${v}" varStatus="s">					
					<span style="align:left; color:red;">${fn:split(item, ':')[0]}</span> :	${fn:split(item, ':')[1]}<br>
				</c:forEach>
				<img src="${product.pImgDetail}" width="900" alt="상품상세" />
			</div>
		</div>
		<%-- content 부분 끝--%>
		
		
	</body>
<!-- </html> -->