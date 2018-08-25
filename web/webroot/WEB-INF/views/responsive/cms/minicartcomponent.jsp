<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:htmlEscape defaultHtmlEscape="true" />

<spring:url value="/cart/miniCart/{/totalDisplay}" var="refreshMiniCartUrl" htmlEscape="false">
	<spring:param name="totalDisplay"  value="${totalDisplay}"/>
</spring:url>
<spring:url value="/cart/rollover/{/componentUid}" var="rolloverPopupUrl" htmlEscape="false">
	<spring:param name="componentUid"  value="${component.uid}"/>
</spring:url>
<c:url value="/cart" var="cartUrl"/>

<div class="nav-cart c-mini-cart"
	 data-block="minicart"
	 data-current-count="${totalItems}"
	 data-get-count-url="${refreshMiniCartUrl}"
	 data-get-view-url="${rolloverPopupUrl}"
	 data-mini-cart-name="<spring:theme code='text.cart'/>"
	 data-mini-cart-empty-name="<spring:theme code='popup.cart.empty'/>"
	 data-mini-cart-items-text="<spring:theme code='basket.items'/>">

	<a href="${cartUrl}" class="c-mini-cart__trigger">
		<span class="c-mini-cart__icon icon-cart"></span>

		<ycommerce:testId code="miniCart_items_label">
			<span class="c-mini-cart__count">
				${totalItems lt 100 ? totalItems : "99+"}
			</span>

			<span class="c-mini-cart__price">
				<c:if test="${totalDisplay == 'TOTAL'}">
					<format:price priceData="${totalPrice}" />
				</c:if>

				<c:if test="${totalDisplay == 'SUBTOTAL'}">
					<format:price priceData="${subTotal}" />
				</c:if>

				<c:if test="${totalDisplay == 'TOTAL_WITHOUT_DELIVERY'}">
					<format:price priceData="${totalNoDelivery}" />
				</c:if>
			</span>
		</ycommerce:testId>
	</a>

	<div class="c-mini-cart__layer"></div>
</div>

