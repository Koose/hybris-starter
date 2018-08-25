<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ attribute name="quoteData" required="true" type="de.hybris.platform.commercefacades.quote.data.QuoteData"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<%--
    ~ /*
    ~  * [y] hybris Platform
    ~  *
    ~  * Copyright (c) 2000-2017 SAP SE or an SAP affiliate company.
    ~  * All rights reserved.
    ~  *
    ~  * This software is the confidential and proprietary information of SAP
    ~  * ("Confidential Information"). You shall not disclose such Confidential
    ~  * Information and shall use it only in accordance with the terms of the
    ~  * license agreement you entered into with SAP.
    ~  *
    ~  */
--%>

<spring:htmlEscape defaultHtmlEscape="true" />
<spring:url value="/quote/{/quoteCode}/edit/" var="editQuoteUrl" htmlEscape="false">
    <spring:param name="quoteCode" value="${quoteData.code}"/>
</spring:url>

<spring:theme code="text.quote.edit.confirmation.modal.title" arguments="${quoteData.code}"
              var="editConfirmationModalTitle"/>

<div class="modal fade" id="js-quote-edit-modal"
     data-edit-confirmation-modal-title="${editConfirmationModalTitle}" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >
                    ${editConfirmationModalTitle}
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div><spring:theme code="text.quote.edit.confirmation.message"/></div>
                <br/>
                <div><b><spring:theme code="text.quote.edit.warning.message"/></b></div>
                <c:if test="${not empty quoteData.expirationTime}">
                    <div>
                        <fmt:formatDate value="${quoteData.expirationTime}" dateStyle="medium" timeStyle="short" type="both"
                                        var="formattedExpirationTime"/>
                        <spring:theme code="text.quote.validity.message"
                                      arguments="${formattedExpirationTime}" argumentSeparator="$$"/>
                    </div>
                </c:if>
                <br/>

                <form:form action="${editQuoteUrl}" method="get">
                    <button type="button"class="btn btn-primary btn-block" id="cancelEditYesButton">
                        <spring:theme code="text.quote.yes.button.label"/>
                    </button>
                    <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal" id="cancelEditNoButton">
                        <spring:theme code="text.quote.no.button.label"/>
                    </button>
                </form:form>
            </div>
        </div>
    </div>
</div>




