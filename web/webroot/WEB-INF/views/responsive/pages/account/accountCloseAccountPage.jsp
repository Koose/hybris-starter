<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<div class="account-section-header account-close-section-header">
    <div class="row">
        <div class="container-lg col-md-6">
            <spring:theme code="text.account.closeAccount.header"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="container-lg col-md-6">
        <div class="account-section-content">
            <div class="account-section-form ">
                <div>
                    <spring:theme code="text.account.closeAccount.retention.info" htmlEscape="false"/>
                </div>
            </div>
            <button type="button" class="btn btn-primary pull-right js-close-account-popup-button" data-popup-title="<spring:theme code="text.account.closeAccount.popup.title"/>">
            <spring:theme code="text.account.closeAccount.button"/>
            </button>


            <div class="modal fade js-close-account-popup" id="popup_confirm_account_removal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">
                                <spring:theme code="text.account.closeAccount.popup.title"/>
                            </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true" class="icon-remove"></span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-details">
                                <spring:theme code="text.account.closeAccount.popup.confirm" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="modal-actions">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <a class="btn btn-primary js-close-account-action">
                                            <spring:theme code="text.account.closeAccount.popup.action" />
                                        </a>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                            <spring:theme code="text.button.cancel" />
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
