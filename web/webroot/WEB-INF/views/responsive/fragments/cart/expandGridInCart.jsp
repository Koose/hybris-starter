<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>

<div id="cartOrderGridForm" class="scrollContent visible">
    <product:productOrderFormGrid product="${product}" showName="false" readOnly="${readOnly}" />
    <div class="order-form-scroll right hidden-sm-down"><span class="icon-next"></span></div>
    <div class="order-form-scroll left hidden-sm-down"><span class="icon-prev"></span></div>
    <div class="order-form-scroll up hidden-sm-down"><span class="icon-up"></span></div>
    <div class="order-form-scroll down hidden-sm-down"><span class="icon-down"></span></div>
</div>

<div class="modal fade variantSelectMobile" id="cartOrderGridFormVariant" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="icon-remove"></span>
                </button>
            </div>
            <div class="modal-body">
            </div>
        </div>
    </div>
</div>