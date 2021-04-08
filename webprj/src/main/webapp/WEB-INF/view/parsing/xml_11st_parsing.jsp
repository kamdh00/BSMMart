<%--list_product.jsp--%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<%-- content 부분--%>
	<section id="content">
		<div class="container">
			<div class="row aln-center">
			<c:if test="${not empty productList}">
			<c:forEach var="product" items="${productList}" varStatus="loop">
				<div class="col-4 col-12-medium">
					<!-- Box #1 -->
						<section>
							<c:url var="url" value="/parsing/detail_xml_11st_parsing">
								<c:param name="pNo" value="${product.pImgName}" />
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
		<br/><br/>
		<p align="center" style="font-size:30px;">
			<c:forEach var="index" begin="1" end="10" varStatus="loop">
			<c:url var="url" value="/parsing/xml_11st_parsing">
				<c:param name="page" value="${index}" />
			</c:url>
			<c:if test="${page == index}">
				${index}
			</c:if>
			<c:if test="${page != index}">
				<a href="${url}" style="text-decoration:none">${index}</a>
			</c:if>
			</c:forEach>
		</p>
	</section>
		<%-- content 부분 끝--%>		
