<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<%@ attribute name="url" required="true" type="java.lang.String"%>
<%@ attribute name="labelKey" required="true" type="java.lang.String"%>
<%@ attribute name="labelArguments" required="false" type="java.lang.String"%>

<spring:htmlEscape defaultHtmlEscape="true" />

<div class="back-link">
	<a class="back-link__link" href="${url}">
		<span class="icon-prev"></span>
	</a>
	<span class="back-link__label">
		<spring:theme code="${labelKey}" arguments="${labelArguments}"/>
	</span>
</div>