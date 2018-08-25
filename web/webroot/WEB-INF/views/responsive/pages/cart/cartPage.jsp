<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<template:page pageTitle="${pageTitle}">

	<cart:cartValidation/>
	<cart:cartPickupValidation/>

	<div class="cart-top-bar">
        <div class="text-right">
            <a href="javascript:void(0)" class="help" data-toggle="modal" data-target="#c-cart-help-modal" >
                <spring:theme code="text.help" />
                <span class="icon-help"></span>
            </a>
		</div>
	</div>

    <div id="c-cart-help-modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><spring:theme code="text.help" /></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="icon-remove"></span>
                    </button>
                </div>
                <div class="modal-body">
                    <strong>${fn:escapeXml(cartData.code)}</strong> <br/>
                    <spring:theme code="basket.page.cartHelpContent" htmlEscape="false" />
                </div>

            </div>
        </div>
    </div>

	<div>
		<div>
            <cms:pageSlot position="TopContent" var="feature">
                <cms:component component="${feature}" element="div" class="yComponentWrapper"/>
            </cms:pageSlot>
		</div>

	   <c:if test="${not empty cartData.rootGroups}">
           <cms:pageSlot position="CenterLeftContentSlot" var="feature">
                <cms:component component="${feature}" element="div" class="yComponentWrapper"/>
           </cms:pageSlot>
        </c:if>
		
		 <c:if test="${not empty cartData.rootGroups}">
            <cms:pageSlot position="CenterRightContentSlot" var="feature">
                <cms:component component="${feature}" element="div" class="yComponentWrapper"/>
            </cms:pageSlot>
            <cms:pageSlot position="BottomContentSlot" var="feature">
                <cms:component component="${feature}" element="div" class="yComponentWrapper"/>
            </cms:pageSlot>
		</c:if>
				
		<c:if test="${empty cartData.rootGroups}">
            <cms:pageSlot position="EmptyCartMiddleContent" var="feature">
                <cms:component component="${feature}" element="div" class="yComponentWrapper content__empty"/>
            </cms:pageSlot>
		</c:if>
	</div>
</template:page>