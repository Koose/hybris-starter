// Component
ACC.quickview = {

    _autoload: [
        'bindToUiCarouselLink'
    ],

    initQuickviewLightbox: function () {
        ACC.product.enableAddToCartButton();
        ACC.product.bindToAddToCartForm();
        ACC.product.enableStorePickupButton();
    },

    refreshScreenReaderBuffer: function () {
        // changes a value in a hidden form field in order
        // to trigger a buffer update in a screen reader
        $('#accesibility_refreshScreenReaderBufferField').attr('value', new Date().getTime());
    },

    bindToUiCarouselLink: function () {
        var _self = this;
        var $modal = $('#quick-view-poup');

        $('.js-owl-carousel-reference .js-reference-item').on('click', function (e) {
            e.preventDefault();
            var $this = $(this);
            var ajaxUrl = $this.attr('href');

            _self.showPopup(ajaxUrl);
        });

        $modal.on('show.bs.modal', function () {
            ACC.quickview.refreshScreenReaderBuffer();
            ACC.quickview.initQuickviewLightbox();
            ACC.ratingstars.bindRatingStars($('.quick-view-stars'));
        });

        $modal.on('hide.bs.modal', function () {
            ACC.quickview.refreshScreenReaderBuffer();
        });
    },
    showPopup: function (ajaxUrl) {
        var $modal = $('#quick-view-poup');

        $.ajax({
            url: ajaxUrl,
            type: 'GET'
        }).done(function (data) {
            $modal.find('.modal-body').html(data);
            $modal.modal('show');
        });
    }
};
