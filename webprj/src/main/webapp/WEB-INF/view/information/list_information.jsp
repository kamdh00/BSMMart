<%--informationListBoard.jsp--%>
<%@page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	
<%-- <%
	AdminVO admin = (AdminVO)session.getAttribute("admin");
	if(admin != null){
%>
	<form action="${pageContext.request.contextPath}/templete.jsp?content=informationWriteForm">
		<input type="submit" value="�� ��" />
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
									<h2>������</h2>
									<h3>�������� �� ����� �Խ���</h3>
								</header>
									<table border="1" align="center">
									<c:if test="${not empty requestScope.informationList }">
										<tr style="border-bottom:solid 1px #ccc;">
											<td width="50"  align="center" style="border-right:solid 1px #ccc;">��ȣ</td>
											<td width="200" align="center" style="border-right:solid 1px #ccc;">����</td>
											<td style="margin:10px; padding:5px;">�ۼ���</td>
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
											<p><tr><td colspan="5">��ϵ� �Խù��� �����ϴ�.</td></tr></p>	
									</c:if>
								</table>
							</section>

					</div>
				</div>
			</div>
		</section>
