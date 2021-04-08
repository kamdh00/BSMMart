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

<section id="content">
					<div class="container">
						<div class="row">
							<div class="col-3 col-12-medium">

								<!-- Sidebar -->
									<section>
										<p style="font-size:30px;"><span><a href="/parsing/json_parsing?page=0" align="left">JSON</a></span>
											<span style="float:right;">XML</span>
										</p>
										<header>
											<h2>뉴스 xml파싱</h2>
										</header>
										<c:if test="${not empty requestScope.listParsing }">
										<ul class="link-list">											
										<c:forEach var="parse" items="${requestScope.listParsing}" varStatus="loop">
											<li style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;width: 200px;">
											${parse.no + 1}. <a href="javascript:changeContent('${parse.title}','${parse.content}','${parse.name}','${parse.date}')" style="color: black;text-decoration:none">${parse.title}</a></li>										
										</c:forEach>
										</ul>
										</c:if>
										<c:if test="${empty requestScope.listParsing }">
												<p>등록된 게시물이 없습니다.</p>	
										</c:if>
									</section>
									<section>
										<c:forEach var="index" begin="0" end="4" varStatus="loop">
										<c:url var="url" value="/parsing/xml_parsing">
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
<!-- Content -->
		<%-- <section id="content">
			<div class="container">
				<div class="row">
					<div class="col-12">

						<!-- Main Content -->
							<section>
								<header>
									<h2>NoSql Parsing하기</h2>
									<h3></h3>
								</header>
									<table border="1" align="center">
									<c:if test="${not empty requestScope.xmlParsing }">
										<tr style="border-bottom:solid 1px #ccc;">
											<td width="50"  align="center" style="border-right:solid 1px #ccc;">번호</td>
											<td width="200" align="center" style="border-right:solid 1px #ccc;">제목</td>
											<td style="margin:10px; padding:5px;">작성일</td>
										</tr>
										<c:forEach var="parse" items="${requestScope.xmlParsing}" varStatus="loop">
										<tr>
											<c:url var="url" value="">
												<c:param name="no" value="${informationBoard.title}"/>
											</c:url>											
											<a href="${url}">${parse.title}</a></td><br><br>
											<td style="margin:10px; padding:5px;">${parse.content}</td>
										</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty requestScope.xmlParsingt }">
											<p><tr><td colspan="5">등록된 게시물이 없습니다.</td></tr></p>	
									</c:if>
								</table>
							</section>

					</div>
				</div>
			</div>
		</section>
 --%>