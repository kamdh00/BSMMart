<%--informationListBoard.jsp--%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
function changeContent(title,content,name,date){
	/* alert(parse);
	var obj = JSON.parse(parse);
	alert(obj.title) */
 	$("#parsingTitle").html(title);
	$("#parsingContent").html(content);
	$("#parsingName").html(name);
	$("#parsingDate").html(date);
}
</script>

<!-- Content -->
<section id="content">
					<div class="container">
						<div class="row">
							<div class="col-3 col-12-medium">

								<!-- Sidebar -->
									<section>
										<p style="font-size:30px;"><span>JSON</span>
											<span style="float:right;"><a href="/parsing/xml_parsing?page=0">XML</a></span>
										</p>
										<header>
											<h2>블로그 json파싱</h2>
										</header>
										<c:if test="${not empty requestScope.listParsing }">
										<ul class="link-list">											
										<c:forEach var="parse" items="${requestScope.listParsing}" varStatus="loop">
											<%-- <li><a href="javascript:changeContent('${parse}')">${parse.title}</a></li> --%>										
											<li style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 200px;">
											${parse.no + 1}. <a href="javascript:changeContent('${parse.title}','${parse.content}','${parse.name}','${parse.date}')" style="color: black;text-decoration:none">${parse.title}</a>
											</li>										
										</c:forEach>
										</ul>
										</c:if>
										<c:if test="${empty requestScope.listParsing }">
												<p>등록된 게시물이 없습니다.</p>	
										</c:if>
									</section>
									<section>
										<c:forEach var="index" begin="0" end="4" varStatus="loop">
										<c:url var="url" value="/parsing/json_parsing">
											<c:param name="page" value="${index}" />
										</c:url>
										<c:if test="${page == index}">
											${index + 1}
										</c:if>
										<c:if test="${page != index}">
											<a href="${url}">${index + 1}</a>
										</c:if>
										</c:forEach>
									</section>

							</div>
							<div class="col-9 col-12-medium imp-medium">

								<!-- Main Content -->
									<section>
										<header>
											<h2 id="parsingTitle">${listParsing[0].title}</h2><span id="parsingDate" style="float:right;">${listParsing[0].date}</span>
											<h3 id="parsingName">${listParsing[0].name}</h3>
										</header>
										<p id="parsingContent">
											${listParsing[0].content}
										</p>										
									</section>

							</div>
						</div>
					</div>
				</section>

