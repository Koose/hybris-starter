<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ attribute name="savedCart" required="true" type="de.hybris.platform.commercefacades.order.data.CartData" %>

<spring:htmlEscape defaultHtmlEscape="true" />


<div class="modal fade" id="popup_confirm_savedcart_delete_${fn:escapeXml(savedCart.code)}" tabindex="-1" role="dialog" aria-hidden="true" data-savedCartInfo="{name:${fn:escapeXml(savedCart.name)}, id:${fn:escapeXml(savedCart.code)}, numberOfProducts:${savedCart.totalItems}">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<spring:theme code='text.account.savedcart.delete.popuptitle'/>
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true" class="icon-remove"></span>
				</button>
			</div>
			<div class="modal-body">
				<p>
					<spring:theme code="text.account.savedcart.delete.msg"/>
				</p>
				<div class="modal-details row">
					<span class="col-6"><spring:theme code="text.account.savedcart.cart.name"/>:</span>
					<span class="col-6"><b>${fn:escapeXml(savedCart.name)}</b></span>
					<span class="col-6"><spring:theme code="text.account.savedcart.cart.id"/>:</span>
					<span class="col-6"><b>${fn:escapeXml(savedCart.code)}</b></span>
					<span class="col-6"><spring:theme code="text.account.savedcart.numberofproducts"/>:</span>
					<span class="col-6"><b>${savedCart.totalItems}</b></span>
				</div>
			</div>
			<div class="modal-footer">
				<div class="row">
					<div class="col-12 col-sm-6 col-sm-push-6">
						<button type="button" class="js-savedcart_delete_confirm btn btn-primary btn-block"
								data-savedcart-id="${fn:escapeXml(savedCart.code)}"><spring:theme code="general.delete.button"/>
						</button>
					</div>
					<div class="col-12 col-sm-6 col-sm-pull-6">
						<button type="button" data-dismiss="modal" class="btn btn-secondary btn-block">
							<spring:theme code="text.button.cancel"/>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
