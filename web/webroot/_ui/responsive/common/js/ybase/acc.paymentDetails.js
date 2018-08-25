// More Info Needed
ACC.paymentDetails = {
    _autoload: [
        'showRemovePaymentDetailsConfirmation'
    ],

    showRemovePaymentDetailsConfirmation: function () {
        $(document).on('click', '.removePaymentDetailsButton', function () {
            var paymentId = $(this).data('paymentId');
            var $modal = $('#popup_confirm_payment_removal_' + paymentId);
            $modal.modal('show');
        });
    }
};
