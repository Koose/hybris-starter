// More info needed
ACC.payment = {
    bindPaymentCardTypeSelect: function () {
        ACC.payment.filterCardInformationDisplayed();
        $('#card_cardType').change(function () {
            var cardType = $(this).val();
            if (cardType === '024') {
                $('#startDate, #issueNum').show();
            } else {
                $('#startDate, #issueNum').hide();
            }
        });
    },
    filterCardInformationDisplayed: function () {
        var cardType = $('#card_cardType').val();

        if (cardType === '024') {
            $('#startDate, #issueNum').show();
        } else {
            $('#startDate, #issueNum').hide();
        }
    }
};

$(document).ready(function () {
    ACC.payment.bindPaymentCardTypeSelect();
});
