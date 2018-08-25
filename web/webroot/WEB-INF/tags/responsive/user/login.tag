<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ attribute name="actionNameKey" required="true" type="java.lang.String"%>
<%@ attribute name="action" required="true" type="java.lang.String"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="formElement" tagdir="/WEB-INF/tags/responsive/formElement"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>

<spring:htmlEscape defaultHtmlEscape="true" />

<c:set var="hideDescription" value="checkout.login.loginAndCheckout" />

<div class="login-page__headline">
	<spring:theme code="login.title" />
</div>

<c:if test="${actionNameKey ne hideDescription}">
	<p>
		<spring:theme code="login.description" />
	</p>
</c:if>

<form:form action="${action}" method="post" commandName="loginForm" class="validate-form">
	<c:if test="${not empty message}">
		<span class="has-error">
			<spring:theme code="${message}" />
		</span>
	</c:if>

	<formElement:formInputBox
			idKey="j_username"
			inputCSS="validate-email"
			labelKey="login.email"
			path="j_username"
			mandatory="true" />

	<formElement:formPasswordBox
			idKey="j_password"
			labelKey="login.password"
			path="j_password"
			inputCSS="form-control"
			mandatory="true" />

	<div class="forgotten-password">
		<ycommerce:testId code="login_forgotPassword_link">
			<a href="#" data-link="<c:url value='/login/pw/request'/>" class="js-password-forgotten" data-cbox-title="<spring:theme code="forgottenPwd.title"/>">
				<spring:theme code="login.link.forgottenPwd" />
			</a>
		</ycommerce:testId>
	</div>

	<ycommerce:testId code="loginAndCheckoutButton">
		<button type="submit" class="btn btn-primary btn-block">
			<spring:theme code="${actionNameKey}" />
		</button>
	</ycommerce:testId>

	<c:if test="${expressCheckoutAllowed}">
		<button type="submit" class="btn btn-secondary btn-block expressCheckoutButton"><spring:theme code="text.expresscheckout.header" /></button>
		<input id="expressCheckoutCheckbox" name="expressCheckoutEnabled" type="checkbox" class="form left doExpressCheckout display-none" />
	</c:if>
</form:form>

<div class="c-forget-password-modal modal fade"  tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >
                    <spring:theme code="forgottenPwd.title"/>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="icon-remove"></span>
                </button>
            </div>
            <div class="modal-body">
            </div>
        </div>
    </div>
</div>
