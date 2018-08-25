<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<%--
<div class="tabhead">
	<a href="">${fn:escapeXml(component.title)}</a><span class="glyphicon"></span>
</div>
--%>
<div class="tabbody">
    <div class="container-fluid">
        ${ycommerce:sanitizeHTML(component.content)}
    </div>
</div>
