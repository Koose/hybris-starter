<%@ page trimDirectiveWhitespaces="true" contentType="application/json" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>

{"cartData": {
"total": "${cartData.totalPrice.value}",
"products": [
<c:forEach items="${cartData.entries}" var="cartEntry" varStatus="status">
	{
		"sku":		"${fn:escapeXml(cartEntry.product.code)}",
		"name": 	"<c:out value='${cartEntry.product.name}' />",
		"qty": 		"${cartEntry.quantity}",
		"price": 	"${cartEntry.basePrice.value}",
		"categories": [
		<c:forEach items="${cartEntry.product.categories}" var="category" varStatus="categoryStatus">
			"<c:out value='${category.name}' />"<c:if test="${not categoryStatus.last}">,</c:if>
		</c:forEach>
		]
	}<c:if test="${not status.last}">,</c:if>
</c:forEach>
]
},

"quickOrderErrorData": [
<c:forEach items="${quickOrderErrorData}" var="quickOrderEntry" varStatus="status">
	{
		"sku":		"${fn:escapeXml(quickOrderEntry.productData.code)}",
		"errorMsg": "<spring:theme code='${quickOrderEntry.errorMsg}' htmlEscape="true"/>"
	}<c:if test="${not status.last}">,</c:if>
</c:forEach>
],

"cartAnalyticsData":{"cartCode" : "${cartCode}","productPostPrice":"${entry.basePrice.value}","productName":"<c:out value='${product.name}' />"}
,
"addToCartLayer":"<spring:escapeBody javaScriptEscape="true" htmlEscape="false">
	<spring:htmlEscape defaultHtmlEscape="true">
	<spring:theme code="text.addToCart" var="addToCartText"/>
	<c:url value="/cart" var="cartUrl"/>
	<ycommerce:testId code="addToCartPopup">
		<div class="c-cart-modal modal" tabindex="-1" role="dialog" data-role="c-cart-modal">
            <div class="c-cart-modal__dialog modal-dialog" role="document">
                <div class="c-cart-modal__content modal-content">

                    <div class="c-cart-modal__header modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span class="icon-close" aria-hidden="true"></span>
                        </button>
                    </div>

                    <div class="c-cart-modal__body modal-body">
                        <div class="c-cart-modal__message">
                            <c:choose>
                                <c:when test="${quickOrderErrorData ne null and not empty quickOrderErrorData}">
                                    <spring:theme code="${quickOrderErrorMsg}" arguments="${fn:length(quickOrderErrorData)}" />
                                </c:when>
                                <c:when test="${multidErrorMsgs ne null and not empty multidErrorMsgs}">
                                    <c:forEach items="${multidErrorMsgs}" var="multidErrorMsg">
                                        <spring:theme code="${multidErrorMsg}" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <spring:theme code="${errorMsg}" />
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <c:choose>
                            <c:when test="${modifications ne null}">
                               <c:forEach items="${modifications}" var="modification">
                                   <c:set var="product" value="${modification.entry.product}" />
                                   <c:set var="entry" value="${modification.entry}" />
                                   <c:set var="quantity" value="${modification.quantityAdded}" />
                                   <cart:popupCartItems entry="${entry}" product="${product}" quantity="${quantity}"/>
                               </c:forEach>
                            </c:when>
                            <c:otherwise>
                               <cart:popupCartItems entry="${entry}" product="${product}" quantity="${quantity}"/>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="c-cart-modal__footer modal-footer">
                       <ycommerce:testId code="checkoutLinkInPopup">
                           <a href="${cartUrl}" class="btn btn-primary add-to-cart-button c-cart-modal__action">
                               <c:choose>
                                   <c:when test="${isQuote}">
                                       <spring:theme code="quote.view" />
                                   </c:when>
                                   <c:otherwise>
                                       <spring:theme code="checkout.checkout" />
                                   </c:otherwise>
                               </c:choose>
                           </a>
                       </ycommerce:testId>

                       <button class="btn btn-secondary c-cart-modal__action" data-dismiss="modal">
                           <spring:theme code="cart.page.continue"/>
                       </button>
                    </div>
                </div>
            </div>
		</div>
	</ycommerce:testId>
	</spring:htmlEscape>
</spring:escapeBody>"
}



