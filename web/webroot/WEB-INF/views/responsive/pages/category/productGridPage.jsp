<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/responsive/common" %>
<%@ taglib prefix="storepickup" tagdir="/WEB-INF/tags/responsive/storepickup" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>


<template:page pageTitle="${pageTitle}">
	<div class="t-plp">
		<cms:pageSlot position="Section1" var="feature" element="div" class="product-grid-section1-slot">
			<cms:component component="${feature}" element="div" class="yComponentWrapper map product-grid-section1-component"/>
		</cms:pageSlot>

		<div class="row">
			<sidebar class="t-plp__sidebar col-sm-12 col-lg-3">
				<div class="t-plp__sidebar-inner">
					<cms:pageSlot position="ProductLeftRefinements" var="feature" element="div" class="t-plp__facets">
						<cms:component component="${feature}"/>
					</cms:pageSlot>
				</div>
			</sidebar>

			<div class="t-plp__products col-sm-12 col-lg-9">
				<cms:pageSlot position="ProductGridSlot" var="feature">
					<cms:component component="${feature}"/>
				</cms:pageSlot>
			</div>
		</div>

		<div class="t-plp__m-actions">
			<div class="c-filters">
				<div class="row">
					<div class="col-6">
						<a class="c-filters__link c-filters__link--bordered js-show-facets" href="#">
							<span class="c-filters__icon icon-list"></span>
							<spring:theme code="text.filters"/>
						</a>
					</div>

					<div class="col-6">
						<div class="c-filters__link js-plp-sort">
							<span class="c-filters__icon icon-grid"></span>
							<spring:theme code="text.sort"/>
							<nav:pagination top="false"  supportShowPaged="false" supportShowAll="false"  searchPageData="${searchPageData}" searchUrl="${searchPageData.currentQuery.url}"  numberPagesShown="${numberPagesShown}"/>

						</div>
					</div>
				</div>

			</div>
		</div>

		<storepickup:pickupStorePopup />
	</div>
</template:page>
