<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="product" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>
<%@ attribute name="entry" required="true" type="de.hybris.platform.commercefacades.order.data.OrderEntryData" %>
<%@ attribute name="quantity" required="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<div class="c-cart-modal-item">
    <c:url value="${product.url}" var="entryProductUrl"/>

    <div class="c-cart-modal-item__thumbnail">
        <a href="${entryProductUrl}">
            <product:productPrimaryImage product="${entry.product}" format="cartIcon"/>
        </a>
    </div>

    <div class="c-cart-modal-item__details">
        <a class="c-cart-modal-item__info c-cart-modal-item__info--name" href="${entryProductUrl}">
            ${fn:escapeXml(product.name)}
        </a>

        <div class="c-cart-modal-item__info-group">
            <span class="c-cart-modal-item__label"><spring:theme code="popup.cart.quantity.added"/></span>
            <span class="c-cart-modal-item__info">${quantity}</span>
        </div>

        <c:forEach items="${product.baseOptions}" var="baseOptions">
            <c:forEach items="${baseOptions.selected.variantOptionQualifiers}" var="baseOptionQualifier">
                <c:set var="baseOptionQualifierValue" value="${fn:escapeXml(baseOptionQualifier.value)}"/>
                <c:if test="${baseOptionQualifier.qualifier eq 'style' and not empty baseOptionQualifier.image.url}">
                    <div class="c-cart-modal-item__info-group">
                        <span class="c-cart-modal-item__label"><spring:theme code="product.variants.colour"/></span>
                        <img class="c-cart-modal-item__info c-cart-modal-item__info--color" src="${baseOptionQualifier.image.url}" alt="${baseOptionQualifierValue}" title="${baseOptionQualifierValue}"/>
                    </div>
                </c:if>
                <c:if test="${baseOptionQualifier.qualifier eq 'size'}">
                    <div class="c-cart-modal-item__info-group">
                        <span class="c-cart-modal-item__label"><spring:theme code="product.variants.size"/></span>
                        <span class="c-cart-modal-item__info">${baseOptionQualifierValue}</span>
                    </div>
                </c:if>
            </c:forEach>
        </c:forEach>

        <c:if test="${not empty entry.deliveryPointOfService.name}">
            <div class="c-cart-modal-item__info-group">
                <span class="c-cart-modal-item__label"><spring:theme code="popup.cart.pickup"/></span>
                <span class="c-cart-modal-item__info">${fn:escapeXml(entry.deliveryPointOfService.name)}</span>
            </div>
        </c:if>

        <div class="c-cart-modal-item__info c-cart-modal-item__info--price">
            <format:price priceData="${entry.basePrice}"/>
        </div>
    </div>
</div>
