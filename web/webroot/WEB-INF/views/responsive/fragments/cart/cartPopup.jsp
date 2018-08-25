<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product"%>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>

<spring:htmlEscape defaultHtmlEscape="true" />

<spring:theme code="text.addToCart" var="addToCartText"/>
<spring:theme code="text.popupCartTitle" var="popupCartTitleText"/>
<c:url value="/cart" var="cartUrl"/>
<c:url value="/cart/checkout" var="checkoutUrl"/>

<c:choose>
	<c:when test="${not empty cartData.quoteData}">
		<c:set var="miniCartProceed" value="quote.view"/>
	</c:when>
	<c:otherwise>
		<c:set var="miniCartProceed" value="checkout.checkout"/>
	</c:otherwise>
</c:choose>

<div class="c-mini-cart__content">
	<ycommerce:testId code="mini-cart-popup">
		<c:choose>
			<c:when test="${numberShowing > 0 }">
				<div class="c-mini-cart__header">
					<span class="c-mini-cart__showing">
						<spring:theme code="popup.cart.showing" arguments="${numberShowing},${numberItemsInCart}"/>
					</span>

					<c:if test="${numberItemsInCart > numberShowing}">
						<a class="c-mini-cart__show-all" href="${cartUrl}"><spring:theme code="popup.cart.showall"/></a>
					</c:if>
				</div>

				<ol class="c-mini-cart__items list-unstyled">
					<c:forEach items="${entries}" var="entry" end="${numberShowing - 1}">
						<c:url value="${entry.product.url}" var="entryProductUrl"/>
						<li class="c-mini-cart__item">
							<a class="c-mini-cart__item-image" href="${entryProductUrl}">
								<product:productPrimaryImage product="${entry.product}" format="cartIcon"/>
							</a>

							<div class="c-mini-cart__item-details">
								<a class="c-mini-cart__item-name" href="${entryProductUrl}">${fn:escapeXml(entry.product.name)}</a>
								<ul class="c-mini-cart__item-list list-unstyled">
									<li class="c-mini-cart__item-qty"><spring:theme code="popup.cart.quantity"/>: ${entry.quantity}</li>

									<c:forEach items="${entry.product.baseOptions}" var="baseOptions">
										<c:forEach items="${baseOptions.selected.variantOptionQualifiers}" var="baseOptionQualifier">
											<c:if test="${baseOptionQualifier.qualifier eq 'style' and not empty baseOptionQualifier.image.url}">
												<li class="c-mini-cart__item-color">
													<span class="label"><spring:theme code="product.variants.colour"/></span>
													<img src="${baseOptionQualifier.image.url}" alt="${fn:escapeXml(baseOptionQualifier.value)}" title="${fn:escapeXml(baseOptionQualifier.value)}"/>
												</li>
											</c:if>
											<c:if test="${baseOptionQualifier.qualifier eq 'size'}">
												<li class="c-mini-cart__item-size">
													<span class="label"><spring:theme code="product.variants.size"/></span>
														${fn:escapeXml(baseOptionQualifier.value)}
												</li>
											</c:if>
										</c:forEach>
									</c:forEach>
								</ul>

								<c:if test="${not empty entry.deliveryPointOfService.name}">
									<div class="itemPickup"><span class="itemPickupLabel"><spring:theme code="popup.cart.pickup"/></span> ${' '} ${fn:escapeXml(entry.deliveryPointOfService.name)}</div>
								</c:if>
							</div>
							<div class="c-mini-cart__item-price"><format:price priceData="${entry.basePrice}"/></div>
						</li>
					</c:forEach>
				</ol>

				<div class="c-mini-cart__totals clearfix">
					<div class="c-mini-cart__totals-key"><spring:theme code="popup.cart.total"/></div>
					<div class="c-mini-cart__totals-value"><format:price priceData="${cartData.totalPrice}"/></div>
				</div>

				<div class="c-mini-cart__actions">
					<a href="${cartUrl}" class="btn btn-primary btn-block c-mini-cart__checkout-btn">
						<spring:theme code="${miniCartProceed }" />
					</a>
				</div>
			</c:when>

			<c:otherwise>
				<c:if test="${not empty lightboxBannerComponent && lightboxBannerComponent.visible}">
					<cms:component component="${lightboxBannerComponent}" evaluateRestriction="true"  />
				</c:if>

				<button class="btn btn-block" disabled="disabled">
					<spring:theme code="${miniCartProceed }" />
				</button>

				<a href="" class="btn btn-secondary btn-block">
					<spring:theme text="Continue Shopping" code="cart.page.continue"/>
				</a>
			</c:otherwise>
		</c:choose>
	</ycommerce:testId>
</div>
