// Component
ACC.futurelink = {

    _autoload: [
        'bindFutureStockLink'
    ],

    bindFutureStockLink: function () {
        $(document).on('click', '.futureStockLink', function (e) {
            e.preventDefault();
            var url = $(this).attr('href');
            var $modal = $('.c-future-link-modal');
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
    }
};
