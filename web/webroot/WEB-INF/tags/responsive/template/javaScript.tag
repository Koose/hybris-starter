<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="cms" tagdir="/WEB-INF/tags/responsive/template/cms" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="javascript" tagdir="/WEB-INF/tags/responsive/javascript" %>
<%@ taglib prefix="components" tagdir="/WEB-INF/tags/responsive/common/components" %>

<c:url value="/" var="siteRootUrl"/>

<template:javaScriptVariables/>
<c:set var='themeName' value="starter" />
<c:choose>
	<c:when test="${wro4jEnabled}">
		<script type="text/javascript" src="${contextPath}/wro/build.min.js"></script>
		<script type="text/javascript" src="${contextPath}/wro/addons.js"></script>
	</c:when>
	<c:otherwise>
		<script
			src="https://code.jquery.com/jquery-3.1.0.js"
			integrity="sha256-slogkvB1K3VOkzAI8QITxV3VzpOnkeNVsKvtkYLMjfk="
			crossorigin="anonymous">
		</script>

		<%-- Vendor --%>
		<script type="text/javascript" src="${contextPath}/_ui/dist/common/vendor.js"></script>

		<%-- Hybris --%>
		<script type="text/javascript" src="${contextPath}/_ui/dist/common/ybase.js"></script>

		<%-- App --%>
		<script type="text/javascript" src="${contextPath}/_ui/dist/common/app.js"></script>
		<%-- TEMPRORARY FIX for IMAGER js issue --%>
		<script type="text/javascript" src="${contextPath}/_ui/responsive/common/js/vendor/Imager.min.js"></script>

		<%-- Theme --%>
		<script type="text/javascript" src="${contextPath}/_ui/dist/theme-${themeName}/theme.js"></script>

		<%-- Cms Action JavaScript files --%>
		<c:forEach items="${cmsActionsJsFiles}" var="actionJsFile">
			<!--<script type="text/javascript" src="${commonResourcePath}/components/ybase/js/cms/${actionJsFile}"></script>-->
		</c:forEach>

		<%-- AddOn JavaScript files --%>
		<c:forEach items="${addOnJavaScriptPaths}" var="addOnJavaScript">
			<script type="text/javascript" src="${addOnJavaScript}"></script>
		</c:forEach>

	</c:otherwise>
</c:choose>

<%-- Default messages for the jQuery validation plugin --%>
<javascript:messages />

<%-- Dialog Default JavaScript Template --%>
<components:dialog />

<cms:previewJS cmsPageRequestContextData="${cmsPageRequestContextData}" />
