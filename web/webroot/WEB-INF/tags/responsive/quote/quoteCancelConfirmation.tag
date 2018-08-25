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
<spring:url value="/quote/{/quoteCode}/cancel/" var="cancelQuoteUrl" htmlEscape="false">
    <spring:param name="quoteCode"  value="${quoteData.code}"/>
</spring:url>
<spring:theme code="text.quote.cancel.confirmation.modal.title" arguments="${quoteData.code}"
              var="cancelConfirmationModalTitle"/>

<div class="modal fade" id="js-quote-cancel-modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">${cancelConfirmationModalTitle}</h5>
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
                <br/>
                <div class="row">
                    <div class="col-12">
                        <c:if test="${(not empty quoteData.expirationTime) && allowedActions['CHECKOUT']}">
                            <p class="modal__bottom--text">
                                <fmt:formatDate value="${quoteData.expirationTime}" dateStyle="medium" timeStyle="short" type="both"
                                                var="formattedExpirationTime"/>
                                <spring:theme code="text.quote.validity.message"
                                              arguments="${formattedExpirationTime}" argumentSeparator="$$"/>
                            </p>
                        </c:if>
                        <p class="modal__bottom--text modal__text--bold"><spring:theme code="text.quote.cancel.confirmation.message"/></p>
                    </div>
                    <div class="col-12">
                        <form:form action="${cancelQuoteUrl}">
                            <button type="submit" class="btn btn-primary btn-block" id="cancelYesButton">
                                <spring:theme code="text.quote.yes.button.label"/>
                            </button>
                            <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal" id="cancelNoButton">
                                <spring:theme code="text.quote.no.button.label"/>
                            </button>
                        </form:form>
                    </div>
                </div>
            </div>



        </div>
    </div>
</div>
