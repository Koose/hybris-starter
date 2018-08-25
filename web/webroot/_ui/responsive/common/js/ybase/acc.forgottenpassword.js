// Component/View/Page?
ACC.forgottenpassword = {

    _autoload: [
        'bindLink'
    ],

    bindLink: function () {
        $(document).on('click', '.js-password-forgotten', function (e) {
            e.preventDefault();
            var url = $(this).data('link');
            var $modal = $('.c-forget-password-modal');
            var $modalContent = $modal.find('.modal-body');

            $.ajax({
                url: url,
                cache: false,
                type: 'GET'
            }).done(function (data) {
                $modalContent.html(data);
                $modal.modal('show');
            });
        });

        $(document).on('click', '.js-forgot-password-submit', function (e) {
            e.preventDefault();
            var $forgotPwdForm = $('#forgottenPwdForm');

            if ($forgotPwdForm.valid()) {
                $.post($('.js-password-forgotten').data('link'),
                    {
                        email: $forgotPwdForm.find('input[name="email"]').val(),
                        CSRFToken: $forgotPwdForm.find('input[name="CSRFToken"]').val()
                    })
                    .done(function (data) {
                        $('.c-forget-password-modal .modal-body').html(data);
                    })
                    .fail(function () {
                        console.log('Error while performing request.');
                    });
            }
        });
    }

};
