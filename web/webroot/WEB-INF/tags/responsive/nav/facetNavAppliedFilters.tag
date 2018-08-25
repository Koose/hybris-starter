<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="pageData" required="true" type="de.hybris.platform.commerceservices.search.facetdata.ProductSearchPageData" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${not empty pageData.breadcrumbs}">
	<div class="c-facets__selected js-facet">
		<h3 class="c-facets__name js-facet-name">
			<spring:theme code="search.nav.applied.facets"/>
		</h3>

		<div class="js-facet-values">
			<ul class="c-facets__selected-items list-unstyled">
				<c:forEach items="${pageData.breadcrumbs}" var="breadcrumb">
					<c:url value="${breadcrumb.removeQuery.url}" var="removeQueryUrl"/>

					<li class="c-facets__selected-item">
					<span class="c-facets__namec-facets__selected-item-name">
							${fn:escapeXml(breadcrumb.facetValueName)}
					</span>

						<a class="link-icon" href="${removeQueryUrl}">
							<span class="sr-only"><spring:theme code="search.nav.appliedFilters" /></span>
							<span class="icon-remove"></span>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</c:if>
