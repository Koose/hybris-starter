<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<div class="accountActions-bottom">
    <div class="row justify-content-end">
	    <c:if test="${fn:length(savedCartData.entries) > 0}">
	        <div class="col-12 col-sm-6 col-md-3 order-md-12">
	            <ycommerce:testId code="savedCartDetails_restore_link">
					<a href="#" class="js-restore-saved-cart restore-item-link"
						data-savedcart-id="${fn:escapeXml(savedCartData.code)}"
						data-restore-popup-title="<spring:theme code='text.account.savedcart.restore.popuptitle'/>">
						<button id="restoreButton" class="btn btn-primary btn-block">
							<spring:theme code="text.account.savedCart.restore"/>
						</button>
					</a>
				</ycommerce:testId>
	        </div>
		</c:if>
        <div class="col-12 col-sm-6 col-md-3 order-md-11">
            <ycommerce:testId code="savedCartDetails_backToSavedCarts_button">
                <spring:url value="/my-account/saved-carts" var="savedCartsUrl" htmlEscape="false" />
                <a href="${savedCartsUrl}">
                    <button type="button" class="btn btn-secondary savedCartBackBtn btn-block">
                        <spring:theme code="text.account.savedCart.backToSavedCarts" />
                    </button>
                </a>
            </ycommerce:testId>
        </div>
    </div>
</div>
