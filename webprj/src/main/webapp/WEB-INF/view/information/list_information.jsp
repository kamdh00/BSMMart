<%--informationListBoard.jsp--%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	
<%-- <%
	AdminVO admin = (AdminVO)session.getAttribute("admin");
	if(admin != null){
%>
	<form action="${pageContext.request.contextPath}/templete.jsp?content=informationWriteForm">
		<input type="submit" value="새 글" />
	</form>
<%
	}
%> --%>

<!-- Content -->
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="col-12">

						<!-- Main Content -->
							<section>
								<header>
									<h2>고객센터</h2>
									<h3>공지사항 및 사용자 게시판</h3>
								</header>
									<table border="1" align="center">
									<c:if test="${not empty requestScope.informationList }">
										<tr style="border-bottom:solid 1px #ccc;">
											<td width="50"  align="center" style="border-right:solid 1px #ccc;">번호</td>
											<td width="200" align="center" style="border-right:solid 1px #ccc;">제목</td>
											<td style="margin:10px; padding:5px;">작성일</td>
										</tr>
										<c:forEach var="informationBoard" items="${requestScope.informationList}" varStatus="loop">
										<tr>
											<td width="50" align="center" style="border-right:solid 1px #ccc;">${informationBoard.iNo}</td>
											<td width="200" style="margin:10px; padding:5px; border-right:solid 1px #ccc;">
											<c:url var="url" value="/information/detail_information">
												<c:param name="no" value="${informationBoard.iNo}"/>
											</c:url>
											<a href="${url}">${informationBoard.iTitle}</a></td>
											<td style="margin:10px; padding:5px;">${informationBoard.iWriteday}</td>
										</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty requestScope.informationList }">
											<p><tr><td colspan="5">등록된 게시물이 없습니다.</td></tr></p>	
									</c:if>
								</table>
							</section>

					</div>
				</div>
			</div>
		</section>
