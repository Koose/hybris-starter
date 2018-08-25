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
<spring:url value="/quote/{/quoteCode}/submit/" var="submitQuoteUrl" htmlEscape="false">
    <spring:param name="quoteCode" value="${quoteData.code}"/>
</spring:url>

<spring:theme code="${ycommerce:isQuoteUserSalesRep() ? 'text.quote.conteroffer.confirmation.modal.title' : 'text.quote.submit.confirmation.modal.title'}"  arguments="${quoteData.code}"
              var="submitConfirmationModalTitle"/>


<div class="modal fade" id="js-quote-submit-modal" data-submit-confirmation-modal-title="${submitConfirmationModalTitle}" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    ${submitConfirmationModalTitle}
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="icon-remove"></span>
                </button>
            </div>
            <div class="modal-body">
                <label class="modal__top--label">
                    <spring:theme code="text.quote.name.label"/>
                </label>
                <p class="modal__top--text js-modal-quote-name">${fn:escapeXml(quoteData.name)}</p>
                <label class="modal__top--label">
                    <spring:theme code="text.quote.description.label"/>
                </label>
                <p class="modal__top--text js-modal-quote-description">${fn:escapeXml(quoteData.description)}</p>

                <c:choose>
                    <c:when test="${ycommerce:isQuoteUserSellerApprover()}">
                        <p class="modal__bottom--text">
                            <fmt:formatDate value="${quoteData.expirationTime}" dateStyle="medium" timeStyle="short" type="both"
                                            var="formattedExpirationTime"/>
                            <spring:theme code="text.quote.validity.message" arguments="${formattedExpirationTime}" argumentSeparator="$$"/>
                        </p>
                    </c:when>
                    <c:when test="${ycommerce:isQuoteUserSalesRep()}">
                        <p class="modal__bottom--text">
                            <spring:theme code="text.quote.expiration.time.warning" arguments="${defaultOfferValidityPeriodDays}"/>
                        </p>
                    </c:when>
                </c:choose>
                <br/>
                <p class="modal__bottom--text modal__text--bold"><spring:theme code="${ycommerce:isQuoteUserSalesRep() ? 'text.quote.conteroffer.possible.checkout.message' : 'text.quote.submit.not.modifiable.message'}"/></p>
                <p class="modal__bottom--text modal__text--bold"><spring:theme code="${ycommerce:isQuoteUserSalesRep() ? 'text.quote.conteroffer.confirmation.message' : 'text.quote.submit.confirmation.message'}"/></p>

                <form:form action="${submitQuoteUrl}" id="quoteSubmitForm">
                    <button type="submit" class="btn btn-primary btn-block" id="submitYesButton">
                        <spring:theme code="text.quote.yes.button.label"/>
                    </button>
                    <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal" id="submitNoButton">
                        <spring:theme code="text.quote.no.button.label"/>
                    </button>
                </form:form>
            </div>

        </div>
    </div>
</div>