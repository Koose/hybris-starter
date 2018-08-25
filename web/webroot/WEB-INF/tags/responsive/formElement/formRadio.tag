<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ attribute name="idKey" required="true" type="java.lang.String"%>
<%@ attribute name="labelKey" required="true" type="java.lang.String"%>
<%@ attribute name="path" required="true" type="java.lang.String"%>
<%@ attribute name="value" required="true" type="java.lang.String"%>
<%@ attribute name="mandatory" required="false" type="java.lang.Boolean"%>
<%@ attribute name="labelCSS" required="false" type="java.lang.String"%>
<%@ attribute name="inputCSS" required="false" type="java.lang.String"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>

<spring:htmlEscape defaultHtmlEscape="true" />

<template:errorSpanField path="${path}">
    <spring:theme code="${idKey}" var="themeIdKey"/>

    <div class="form-check">
        <form:radiobutton cssClass="${inputCSS} form-check-input" id="${themeIdKey}" path="${path}" value="${value}" />
        <label class="form-check-label ${labelCSS}" for="${themeIdKey}">
            <spring:theme code="${labelKey}"/>
            <c:if test="${mandatory != null && mandatory == true}">
	   				<span class="mandatory">
	   					<spring:theme code="login.required" var="loginrequiredText" />
	   				</span>
            </c:if>
            <span class="skip"><form:errors path="${path}"/></span>
        </label>
    </div>
</template:errorSpanField>
