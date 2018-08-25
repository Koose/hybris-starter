<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="facetData" required="true" type="de.hybris.platform.commerceservices.search.facetdata.FacetData" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<c:if test="${not empty facetData.values}">
<ycommerce:testId code="facetNav_title_${facetData.name}">
	<div class="c-facets__group js-facets__group">
		<h3 class="c-facets__name js-facet-name">
			<span class="c-facets__name-arrow"></span>
			<spring:theme code="search.nav.facetTitle" arguments="${facetData.name}"/>
		</h3>

		<div class="c-facets__values js-facet-values js-facet-form">
			<c:if test="${not empty facetData.topValues}">
				<ul class="c-facets__items js-facet-list js-facet-top-values list-unstyled">
					<c:forEach items="${facetData.topValues}" var="facetValue">
						<li class="c-facets__item">
							<c:if test="${facetData.multiSelect}">
								<form action="#" method="get">
									<input type="hidden" name="q" value="${facetValue.query.query.value}"/>
									<input type="hidden" name="text" value="${searchPageData.freeTextSearch}"/>
									<label class="c-facets__item-label">
										<input class="c-facets__item-checkbox" type="checkbox" ${facetValue.selected ? 'checked="checked"' : ''} />

										<span class="c-facets__item-content">
											<span class="c-facets__item-mark"></span>
											<span class="c-facets__item-text">
												${fn:escapeXml(facetValue.name)}

												<ycommerce:testId code="facetNav_count">
													<span class="c-facets__item-count"><spring:theme code="search.nav.facetValueCount" arguments="${facetValue.count}"/></span>
												</ycommerce:testId>
											</span>
										</span>
									</label>
								</form>
							</c:if>

							<c:if test="${not facetData.multiSelect}">
								<c:url value="${facetValue.query.url}" var="facetValueQueryUrl"/>
								<a class="c-facets__item-link" href="${facetValueQueryUrl}&amp;text=${fn:escapeXml(searchPageData.freeTextSearch)}">${fn:escapeXml(facetValue.name)}</a>&nbsp;

								<ycommerce:testId code="facetNav_count">
									<span class="c-facets__item-count"><spring:theme code="search.nav.facetValueCount" arguments="${facetValue.count}"/></span>
								</ycommerce:testId>
							</c:if>
						</li>
					</c:forEach>
				</ul>
			</c:if>

			<ul class="c-facets__items js-facet-list list-unstyled <c:if test="${not empty facetData.topValues}">hide js-facet-list-hidden</c:if>">
				<c:forEach items="${facetData.values}" varStatus="loop" var="facetValue">
					<li class="c-facets__item">
						<c:if test="${facetData.multiSelect}">
							<ycommerce:testId code="facetNav_selectForm">
							<form action="#" method="get">
								<input type="hidden" name="q" value="${facetValue.query.query.value}"/>
								<input type="hidden" name="text" value="${searchPageData.freeTextSearch}"/>
								<div class="custom-control custom-checkbox">
								    <input id="${fn:escapeXml(facetValue.name)}_${loop.index}" type="checkbox" ${facetValue.selected ? 'checked="checked"' : ''}  class="custom-control-input c-facets__item-checkbox js-facet-checkbox" />
								    <label class="custom-control-label c-facets__item-label" for="${fn:escapeXml(facetValue.name)}_${loop.index}">
                                        <span class="c-facets__item-content">
                                            <span class="c-facets__item-text">
                                                ${fn:escapeXml(facetValue.name)}&nbsp;
                                                <ycommerce:testId code="facetNav_count">
                                                    <span class="c-facets__item-count"><spring:theme code="search.nav.facetValueCount" arguments="${facetValue.count}"/></span>
                                                </ycommerce:testId>
                                            </span>
                                        </span>
                                    </label>
								</div>
							</form>
							</ycommerce:testId>
						</c:if>
						<c:if test="${not facetData.multiSelect}">
							<c:url value="${facetValue.query.url}" var="facetValueQueryUrl"/>
							<span>
								<a class="c-facets__item-link" href="${facetValueQueryUrl}">${fn:escapeXml(facetValue.name)}</a>
								<ycommerce:testId code="facetNav_count">
									<span class="c-facets__item-count"><spring:theme code="search.nav.facetValueCount" arguments="${facetValue.count}"/></span>
								</ycommerce:testId>
							</span>
						</c:if>
					</li>
				</c:forEach>
			</ul>

			<c:if test="${not empty facetData.topValues}">
				<span class="c-facets__more js-more-facet-values">
					<a href="#" class="js-more-facet-values-link" ><spring:theme code="search.nav.facetShowMore_${facetData.code}" /></a>
				</span>

				<span class="c-facets__less js-less-facet-values">
					<a href="#" class="js-less-facet-values-link"><spring:theme code="search.nav.facetShowLess_${facetData.code}" /></a>
				</span>
			</c:if>
		</div>
	</div>
</ycommerce:testId>
</c:if>
