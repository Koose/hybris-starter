<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<c:if test="${not product.multidimensional }">
    <div class="c-add-to-cart">
        <c:url value="/cart/add" var="addToCartUrl"/>
        <spring:url value="${product.url}/configuratorPage/{/configuratorType}" var="configureProductUrl" htmlEscape="false">
            <spring:param name="configuratorType" value="${configuratorType}" />
        </spring:url>

        <form:form id="addToCartForm${fn:escapeXml(product.code)}" action="${addToCartUrl}" method="post" class="c-add-to-cart__form">

            <ycommerce:testId code="addToCartButton">
                <input type="hidden" name="productCodePost" value="${fn:escapeXml(product.code)}"/>
                <input type="hidden" name="productNamePost" value="${fn:escapeXml(product.name)}"/>
                <input type="hidden" name="productPostPrice" value="${product.price.value}"/>

                <c:choose>
                    <c:when test="${product.stock.stockLevelStatus.code eq 'outOfStock' }">
                        <button type="submit" class="btn btn-primary btn-block"
                                aria-disabled="true" disabled="disabled">
                            <spring:theme code="basket.add.to.basket" />
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button type="submit" class="c-add-to-cart__button btn btn-primary btn-block js-enable-btn" disabled="disabled">
                            <spring:theme code="basket.add.to.basket" />
                        </button>
                    </c:otherwise>
                </c:choose>
            </ycommerce:testId>
        </form:form>

        <form:form id="configureForm${fn:escapeXml(product.code)}" action="${configureProductUrl}" method="get" class="configure_form">
            <c:if test="${product.configurable}">
                <c:choose>
                    <c:when test="${product.stock.stockLevelStatus.code eq 'outOfStock' }">
                        <button id="configureProduct" type="button" class="btn btn-primary btn-block"
                                disabled="disabled">
                            <spring:theme code="basket.configure.product"/>
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button id="configureProduct" type="button" class="btn btn-primary btn-block js-enable-btn" disabled="disabled"
                                onclick="location.href='${configureProductUrl}'">
                            <spring:theme code="basket.configure.product"/>
                        </button>
                    </c:otherwise>
                </c:choose>
            </c:if>
        </form:form>
    </div>
</c:if>
