<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:htmlEscape defaultHtmlEscape="true"/>
<c:set  var="searchUrl" value="/my-account/my-replenishment?sort=${ycommerce:encodeUrl(searchPageData.pagination.sort)}"/>

<div class="account-section-header">
    <spring:theme code="text.account.replenishment.orders"/>
</div>

<c:if test="${empty searchPageData.results}">
    <div class="row">
        <div class="col-md-6 col-md-push-3">
            <div class="account-section-content content-empty">
                <ycommerce:testId code="replenishment_orderHistory_noOrders_label">
                    <spring:theme code="text.account.replenishment.noReplenishment"/>
                </ycommerce:testId>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${not empty searchPageData.results}">
    <div class="account-section-content ">

        <div class="account-orderhistory-pagination">
            <nav:pagination top="true" supportShowPaged="${isShowPageAllowed}" supportShowAll="${isShowAllAllowed}" searchPageData="${searchPageData}" searchUrl="${searchUrl}"
                            msgKey="text.account.replenishment.page" numberPagesShown="${numberPagesShown}" hideRefineButton="true"/>
        </div>
        <div class="account-overview-table replenishment-overview-table">
            <table class="table responsive-table">
                <thead>
                    <tr class="responsive-table-head hidden-md-down">
                        <th><spring:theme code="text.account.replenishment.replenishmentNumber"/></th>
                        <th><spring:theme code="text.account.replenishment.purchaseOrderNumber"/></th>
                        <th><spring:theme code="text.account.replenishment.startDate"/></th>
                        <th><spring:theme code="text.account.replenishment.Schedule"/></th>
                        <th><spring:theme code="text.account.replenishment.nextOrderDate"/></th>
                        <th><spring:theme code="text.account.replenishment.creationDate"/></th>
                        <th><spring:theme code="text.account.replenishment.total"/></th>
                        <th><spring:theme code="text.account.replenishment.actions"/></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${searchPageData.results}" var="replenishment">
                        <c:url value="/my-account/my-replenishment/${ycommerce:encodeUrl(replenishment.jobCode)}" var="replenishmentJobLink"/>
                        <tr class="responsive-table-item">
                            <td class="hidden-md-down">
                                <spring:theme code='text.account.replenishment.orderNumber'/>
                            </td>
                            <td class="responsive-table-cell" data-lebal2="${cancelReplenishmentUrl}" >
                                <ycommerce:testId code="replenishment_jobcode_link">
                                    <a href="${replenishmentJobLink}" class="responsive-table-link"><c:out value="${replenishment.jobCode}"/></a>
                                </ycommerce:testId>
                            </td>
                            <td class="hidden-md-down">
                                <spring:theme code='text.account.replenishment.purchaseOrderNumber'/>
                            </td>
                            <td class="responsive-table-cell">
                                <ycommerce:testId code="replenishment_purchaseOrderNumber_label">
                                    <c:out value="${replenishment.purchaseOrderNumber}"/>
                                </ycommerce:testId>
                            </td>
                            <td class="hidden-md-down">
                                <spring:theme code='text.account.replenishment.startDate'/>
                            </td>
                            <td class="responsive-table-cell">
                                <ycommerce:testId code="replenishment_activationTime_label">
                                    <fmt:formatDate value="${replenishment.firstOrderDate}" dateStyle="medium"/>
                                </ycommerce:testId>
                            </td>
                            <td class="hidden-md-down">
                                <spring:theme code='text.account.replenishment.Schedule'/>
                            </td>
                            <td class="responsive-table-cell">
                                <ycommerce:testId code="orderHistory_schedule_label">
                                    ${fn:escapeXml(replenishment.triggerData.displayTimeTable)}
                                </ycommerce:testId>
                            </td>
                            <td class="hidden-md-down">
                                <spring:theme code='text.account.replenishment.nextOrderDate'/>
                            </td>
                            <td class="responsive-table-cell">
                                <ycommerce:testId code="replenishment_nextActivationTime_label">
                                    <c:if test="${replenishment.active}">
                                        <fmt:formatDate value="${replenishment.triggerData.activationTime}" dateStyle="medium"/>
                                    </c:if>
                                    <c:if test="${not replenishment.active}">
                                        <spring:theme code="text.account.replenishment.canceled"/>
                                    </c:if>
                                </ycommerce:testId>
                            </td>
                            <td class="hidden-md-down">
                                <spring:theme code='text.account.replenishment.creationDate'/>
                            </td>
                            <td class="responsive-table-cell">
                                <ycommerce:testId code="replenishment_creationTime_label">
                                    <fmt:formatDate value="${replenishment.triggerData.creationTime}" dateStyle="medium"/>
                                </ycommerce:testId>
                            </td>
                            <td class="hidden-md-down responsive-table-cell-bold">
                                <spring:theme code='text.account.replenishment.total'/>
                            </td>
                            <td class="responsive-table-cell responsive-table-cell-bold">
                                <ycommerce:testId code="replenishment_estTotal_label">
                                    ${fn:escapeXml(replenishment.totalPrice.formattedValue)}
                                </ycommerce:testId>
                            </td>
                            <td class="responsive-table-cell less-padding">
                                <ycommerce:testId code="replenishment_Actions_links">
                                    <c:if test="${replenishment.active}">
                                        <a href="#" class="replenishment-cancel-button js-replenishment-cancel-button responsive-table-link" data-job-code="<c:out value='${replenishment.jobCode}'/>"
                                        data-popup-title="<spring:theme code='text.account.replenishment.remove.confirmation.title' arguments='${replenishment.jobCode}'/>">
                                        <span class="icon-remove"></span>
                                        </a>
                                    </c:if>
                                </ycommerce:testId>
                            </td>
                        </tr>



                        <div class="modal fade replenishment-order-cancel-modal"  id="popup_confirm_replenishment_order_cancellation_${fn:escapeXml(replenishment.jobCode)}" tabindex="-1" role="dialog"  aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title"><spring:theme code='text.account.replenishment.remove.confirmation.title'/></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true" class="icon-remove"></span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p class="replenishment-order-cancel-modal-content">
                                            <spring:theme code="text.account.replenishment.confirm.cancel" arguments="${replenishment.jobCode}"/>
                                        </p>
                                    </div>
                                    <div class="modal-footer">
                                        <form:form action="detail/cancel/${ycommerce:encodeUrl(replenishment.jobCode)}">
                                            <div class="row">
                                                <div class="col-12 col-sm-6 col-sm-push-6">
                                                    <button type="submit" class="btn btn-primary btn-block">
                                                        <spring:theme code="text.account.yes.button"/>
                                                    </button>
                                                </div>
                                                <div class="col-12 col-sm-6 col-sm-pull-6">
                                                    <button data-dismiss="modal" type="button" class="btn btn-default btn-block js-replenishment-order-cancel-modal-cancel-button">
                                                        <spring:theme code="text.account.no.button"/>
                                                    </button>
                                                </div>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="account-orderhistory-pagination">
            <nav:pagination top="false" supportShowPaged="${isShowPageAllowed}" supportShowAll="${isShowAllAllowed}" searchPageData="${searchPageData}" searchUrl="${searchUrl}"
                            msgKey="text.account.replenishment.page" numberPagesShown="${numberPagesShown}" hideRefineButton="true"/>
        </div>
    </div>
</c:if>