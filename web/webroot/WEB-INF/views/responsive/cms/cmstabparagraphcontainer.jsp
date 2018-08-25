<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="c-tabs">
	<ul class="c-tabs__nav nav nav-tabs d-none d-md-flex" id="myTab" role="tablist">
		<c:forEach var="component" varStatus="loop" items="${components}">
			<c:set var = "title" value = "${fn:escapeXml(component.title)}" />
			<c:set var = "ActiveClass" value = "" />
			<c:if test="${loop.index == 0}">
				<c:set var = "ActiveClass" value = "active" />
			</c:if>


			<li class="nav-item">
				<a class="nav-link ${ActiveClass}" data-toggle="tab" href="#${fn:replace(fn:trim(title), ' ', '')}-tab" role="tab" aria-controls="home" aria-selected="true">${fn:escapeXml(component.title)}</a>
			</li>
		</c:forEach>
	</ul>

    <div class="c-tabs__content tab-content">
		<c:forEach var="component" varStatus="loop" items="${components}">
			<c:set var = "title" value = "${fn:escapeXml(component.title)}" />
			<c:set var = "title" value = "${fn:escapeXml(component.title)}" />
			<c:set var = "ActiveClass" value = "" />
			<c:if test="${loop.index == 0}">
				<c:set var = "ActiveClass" value = "show active" />
			</c:if>

			<div class="tab-pane fade ${ActiveClass}" id="${fn:replace(fn:trim(title), ' ', '')}-tab" role="tabpanel" aria-labelledby="profile-tab">


				<div class="card-header d-md-none" role="tab" id="heading-${fn:replace(fn:trim(title), ' ', '')}">
					<a data-toggle="collapse" href="#collapse-${fn:replace(fn:trim(title), ' ', '')}" data-parent="#content" aria-expanded="false" aria-controls="collapse-${fn:replace(fn:trim(title), ' ', '')}">
						${fn:escapeXml(component.title)}
					</a>
				</div>
				<div id="collapse-${fn:replace(fn:trim(title), ' ', '')}" class="collapse" role="tabpanel" aria-labelledby="heading-${fn:replace(fn:trim(title), ' ', '')}">
					<div class="card-body">
						<cms:component component="${component}" />
					</div>
				</div>


			</div>
		</c:forEach>
	</div>
</div>
