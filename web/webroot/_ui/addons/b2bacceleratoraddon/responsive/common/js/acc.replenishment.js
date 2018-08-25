ACC.replenishment = {
	_autoload: [
		"bindToCancelReplenishmentOrderActionButton"
	],

	bindToCancelReplenishmentOrderActionButton: function ()
	{
		$(document).on("click", '.js-replenishment-cancel-button', ACC.replenishment.handleCancelReplenishmentOrderButtonClick);
	},

	handleCancelReplenishmentOrderButtonClick: function() {
		var replenishmentNumber = $(this).data('job-code');
		var $modal =$('#popup_confirm_replenishment_order_cancellation_' + replenishmentNumber);
		$modal.modal('show');
	}
}