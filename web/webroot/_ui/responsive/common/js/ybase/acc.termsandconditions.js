// Component?
ACC.termsandconditions = {

    bindTermsAndConditionsLink: function () {
        var $modal = $('#termsModal');

        $(document).on('click', '.termsAndConditionsLink', function (e) {
            e.preventDefault();
            var viewUrl = $(this).attr('href');
            var $modalBody = $modal.find('.modal-body');

            $.ajax({
                url: viewUrl,
                cache: false,
                type: 'GET'
            }).done(function (data) {
                $modalBody.html(data);
                $modal.modal('show');
            });
        });

        $modal.on('show.bs.modal', function (event) {
            ACC.common.refreshScreenReaderBuffer();
        });

        $modal.on('hide.bs.modal', function (event) {
            ACC.common.refreshScreenReaderBuffer();
        });
    },

    handleRegisterChkTermsConditionsChange: function () {
        $('#registerChkTermsConditions').change(function (e) {
            e.preventDefault();
            var form = $(this).parents('form:first');
            var btnSubmit = form.find(':submit');

            if ($(this).is(':checked')) {
                btnSubmit.prop('disabled', false);
            } else {
                btnSubmit.prop('disabled', true);
            }
        });
    }
};

$(function () {
    ACC.termsandconditions.bindTermsAndConditionsLink();
    ACC.termsandconditions.handleRegisterChkTermsConditionsChange();
    $('#registerChkTermsConditions').removeAttr('disabled');
    $('[name="consentForm.consentGiven"]').removeAttr('disabled');
});
