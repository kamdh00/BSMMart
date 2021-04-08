<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
function logout(name){				
	$.ajax({
		url:"/user/logout",
		method:"get",
		dataType:"json",		
		success:function(data){			
			alert(name+"님이 로그아웃 하셨습니다.");			
		}
	});	
	
	window.location.href = "/product/list_product";
}
</script>
<%
	Date time = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!-- Header -->
<section id="header">
<%
String loginId = (String)session.getAttribute("loginId"); 
String loginName = (String)session.getAttribute("loginName");
%>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<%
				if(loginId != null){					
				%>
				<div id="logout" align="right"><span style='color:white; font-weight:bold;'><%=loginName%>님</span> &nbsp;<a href="javascript:logout('<%=loginName%>')" style="color:white;">로그아웃</a></div>
				<%} else{ %>
				<div id="login" align="right"><a href="/user/login/" style="color:white;">로그인</a></div>
				<%} %>
				<!-- Logo -->				
				<h1>
					<a href="/product/list_product" id="logo">BSM-Mart</a>
				</h1>

				<!-- Nav -->
				<nav id="nav">
					<c:url var="url" value="/product/list_product_clothes">
						<c:param name="cNo" value="1" />
					</c:url>
					<a href="${url}">의류</a> 
					<c:url var="url" value="/product/list_product_food">
						<c:param name="cNo" value="2" />
					</c:url>
					<a href="${url}">식품</a>
					<c:url var="url" value="/product/list_product_necessity">
						<c:param name="cNo" value="3" />
					</c:url> 
					<a href="${url}">생활용품</a> 
					<a href="/parsing/json_parsing?page=0">네이버API</a>
					<a href="/parsing/xml_11st_parsing?page=0">11번가 API</a> 
					<a href="/information/list_information">고객센터</a>
				</nav>

			</div>
		</div>
	</div>
	<div id="banner">
		<div class="container">
			<div class="row">
				<div class="col-6 col-12-medium">

					<!-- Banner Copy -->
					<p>쿠팡 상품 토대로 <br>샘플로 제작중인 쇼핑몰 입니다.</p>
					<a href="https://www.coupang.com/" target="blank" class="button-large">쿠팡 바로가기</a>

				</div>
				<div class="col-6 col-12-medium imp-medium">

					<!-- Banner Image -->
					<a href="https://www.coupang.com/" class="bordered-feature-image"><img
						src="/assets/css/images/logo_coupang.png" alt="" /></a>

				</div>
			</div>
		</div>
	</div>
</section>