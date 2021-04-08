<%--list_product.jsp--%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 </head>
	<body>
	<%-- content 부분--%>
	<section id="content">
		<div class="container">
			<div class="row aln-center">
			<c:if test="${not empty productList}">
			<c:forEach var="product" items="${productList}" varStatus="loop">
				<div class="col-4 col-12-medium">
					<!-- Box #1 -->
						<section>
							<c:url var="url" value="/product/detail_product">
								<c:param name="pNo" value="${product.pNo}" />
							</c:url>
							<header>
								<h2>${product.pCompany}</h2>
								<h3>${product.pName}</h3>
							</header>
							<a href="${url }" class="feature-image"><img src="${product.pImgUrl}" alt="" /></a>
							<p>${product.pPrice} 원</p>
						</section>

				</div>
				</c:forEach>
			</c:if>
			</div>
		</div>
	</section>
		<%-- content 부분 끝--%>		
	</body>