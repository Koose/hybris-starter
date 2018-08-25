<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="idKey" required="true" type="java.lang.String" %>
<%@ attribute name="labelKey" required="true" type="java.lang.String" %>
<%@ attribute name="path" required="true" type="java.lang.String" %>
<%@ attribute name="items" required="true" type="java.util.Collection" %>
<%@ attribute name="itemValue" required="false" type="java.lang.String" %>
<%@ attribute name="itemLabel" required="false" type="java.lang.String" %>
<%@ attribute name="mandatory" required="false" type="java.lang.Boolean" %>
<%@ attribute name="labelCSS" required="false" type="java.lang.String" %>
<%@ attribute name="selectCSSClass" required="false" type="java.lang.String" %>
<%@ attribute name="skipBlank" required="false" type="java.lang.Boolean" %>
<%@ attribute name="skipBlankMessageKey" required="false" type="java.lang.String" %>
<%@ attribute name="selectedValue" required="false" type="java.lang.String" %>
<%@ attribute name="tabindex" required="false" rtexprvalue="true" %>
<%@ attribute name="disabled" required="false" type="java.lang.Boolean" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true" />
<c:set var="escapedPath" value="${fn:escapeXml(path)}"/>
<c:set var="escapedIdKey" value="${fn:escapeXml(idKey)}"/>
<template:errorSpanField path="${path}">
	<ycommerce:testId code="LoginPage_Item_${idKey}">
		<label class="col-form-label ${fn:escapeXml(labelCSS)}" for="${escapedIdKey}">
			<spring:theme code="${labelKey}"/>
			<c:if test="${mandatory != null && mandatory == true}">
				<span class="mandatory">
					<spring:theme code="login.required" var="loginRequiredText" />
				</span>
			</c:if>
				<span class="skip">
					<form:errors path="${escapedPath}"/>
				</span>
		</label>

		<c:if test="${mandatory == true}">
			<spring:theme code="form.validation.message.required" arguments="${fn:toLowerCase(itemLabel)}" var="requiredLabel"/>
		</c:if>

		<div class="control">
			<form:select id="${escapedIdKey}"
						 path="${escapedPath}"
						 cssClass="${fn:escapeXml(selectCSSClass)}"
						 tabindex="${fn:escapeXml(tabindex)}"
						 disabled="${disabled}"
						 data-rule-required="${mandatory}"
						 data-msg-required="${requiredLabel}">

				<c:if test="${skipBlank == null || skipBlank == false}">
					<option value="" disabled="disabled" ${empty selectedValue ? 'selected="selected"' : ''}>
						<spring:theme code='${skipBlankMessageKey}'/>
					</option>
				</c:if>

				<form:options items="${items}" itemValue="${not empty itemValue ? itemValue :'code'}" itemLabel="${not empty itemLabel ? itemLabel :'name'}" htmlEscape="true"/>
			</form:select>
		</div>
	</ycommerce:testId>
</template:errorSpanField>