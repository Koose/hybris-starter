<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="actionUrl" required="true" type="java.lang.String"%>
<%@ attribute name="titleKey" required="true" type="java.lang.String"%>
<%@ attribute name="messageKey" required="false" type="java.lang.String"%>

<spring:htmlEscape defaultHtmlEscape="true" />
<c:set var="loc_val">
    <spring:message code="basket.save.cart.max.chars" />
</c:set>
<input type="hidden" id="localized_val" name="localized_val" value="${loc_val}"/>

<div class="modal fade" id="saveCart" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<spring:theme code="${titleKey}"/>
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true" class="icon-remove"></span>
				</button>
			</div>
			<div class="modal-body">
				<form:form action="${actionUrl}" id="saveCartForm" commandName="saveCartForm" autocomplete="off">
					<div class="form-group">
						<c:if test="${not empty messageKey}">
							<div class="legend"><spring:theme code="${messageKey}"/></div>
						</c:if>

						<label class="col-form-label" for="name">
							<spring:theme code="basket.save.cart.name" />
						</label>
						<form:input cssClass="form-control" id="saveCartName" path="name" maxlength="255" />
						<div class="help-block right-cartName" id="remain">
						</div>
					</div>
					<div class="form-group">
						<label class="col-form-label" for="description">
							<spring:theme code="basket.save.cart.description" />
						</label>
						<form:textarea cssClass="form-control" id="saveCartDescription" path="description" maxlength="255" />
						<div class="help-block" id="remainTextArea">
						</div>
					</div>
					<div class="form-actions">
						<div class="modal-actions">
							<div class="row">
								<div class="col-sm-12">
									<button type="submit" class="btn btn-primary btn-block" id="saveCartButton" disabled="disabled">
										<spring:theme code="basket.save.cart.action.save"/>
									</button>

									<button type="button" class="btn btn-secondary btn-block" data-dismiss="modal" id="cancelSaveCartButton">
										<spring:theme code="basket.save.cart.action.cancel"/>
									</button>
								</div>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>


