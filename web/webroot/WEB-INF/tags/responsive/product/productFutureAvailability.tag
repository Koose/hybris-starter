<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ attribute name="product" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>
<%@ attribute name="futureStockEnabled" required="true" type="java.lang.Boolean" %>

<c:if test="${futureStockEnabled}">
	<ycommerce:testId code="productDetails_showAvailability_label">
		<c:url value="${product.url}/futureStock" var="productfutureStockUrl"/>
		<a class="futureStockLink" href="${productfutureStockUrl}" target="_blank" title="<spring:theme code="basket.page.viewFuture"/>">
			<spring:theme code="basket.page.viewFuture"/>
		</a>

        <div class="c-future-link-modal modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><spring:theme code="basket.page.viewFuture"/></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="icon-remove"></span>
                        </button>
                    </div>
                    <div class="modal-body">
dfgdfg
                    </div>
                </div>
            </div>
        </div>
	</ycommerce:testId>
</c:if>

