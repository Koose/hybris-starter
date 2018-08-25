// Account related functionality?
ACC.close = {
    _autoload: [
        ['bindCloseAccountModalButtons', $('.js-close-account-popup-button').length !== 0],
        ['bindCloseAccountButton', $('.js-close-account-popup-button').length !== 0]
    ],

    bindCloseAccountModalButtons: function () {
        $('.js-close-account-popup-button').click(function (event) {
            event.preventDefault();
            var $modal = $('#popup_confirm_account_removal');
            $modal.modal('show');
        });
    },

    bindCloseAccountButton: function () {
        $(document).on('click', '.js-close-account-action', function (event) {
            event.preventDefault();
            var url = ACC.config.encodedContextPath + '/my-account/close-account';
            var $modal = $('#popup_confirm_account_removal');

            $.ajax({
                url: url,
                type: 'POST',
                success: function (response) {
                    $modal.modal('hide');
                    var url = ACC.config.encodedContextPath + '/logout?closeAcc=true';
                    window.location.replace(url);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert('Failed to close account. Error: [' + errorThrown + ']');
                    window.location.reload();
                }
            });
        });
    }
};
