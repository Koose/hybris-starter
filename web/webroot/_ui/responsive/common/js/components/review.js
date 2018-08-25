var Reviews = new Class({
    _nameSpace: 'Reviews',

    /**
     * Default Options
     */
    defaults: {

    },

    /**
     * Initialization of the component
     * @param el
     * @param options
     */
    initialize: function (el, options) {
        this.opts = $.extend(this.defaults, options || {});
        this.el = el;
        this.$el = $(el);
        this.$tab = $('#myTab a[href="#Reviews-tab"]');
        this.$collapse = $('#collapse-Reviews');
        this.$collapseHeading = $('a[href="#collapse-Reviews"]');
        this.$document = $(document);

        this._bindEvents();

        this.hideReviewBtn();
        this.determineToDisplayReviews();
    },

    /**
     * Handle the binding of events
     * @private
     */
    _bindEvents: function () {
        var _self = this;

        this.$collapseHeading.on('click', function (e) {
            e.preventDefault();
            _self.showReviewsAction('reviews');
        });

        this.$tab.on('click', function (e) {
            e.preventDefault();
            _self.showReviewsAction('reviews');
        });

        this.$el.on('click', '.all-reviews-btn', function (e) {
            e.preventDefault();
            _self.showReviewsAction('allreviews');
            _self.hideReviewBtn('.all-reviews-btn');
            _self.showReviewBtn('.less-reviews-btn');
        });

        this.$el.on('click', '.less-reviews-btn', function (e) {
            e.preventDefault();
            _self.showReviewsAction('reviews');
            _self.hideReviewBtn('.less-reviews-btn');
            _self.showReviewBtn('.all-reviews-btn');
        });

        this.$document.on('click', '.js-writeReviewTab', function (e) {
            e.preventDefault();
            _self.$tab.tab('show');
            _self.$collapse.collapse('show');
            _self.showReviewsAction('reviews');

            if (_self.$tab.is(':visible')) {
                Gorilla.Utils.scrollToDiv(_self.$tab);
            } else {
                Gorilla.Utils.scrollToDiv(_self.$collapseHeading);
            }

            $('.js-review-write').show();
            $('#reviewForm input[name=headline]').focus();
        });

        this.$document.on('click', '.js-review-write-toggle', function (e) {
            e.preventDefault();
            if ($('.js-review-write:visible').length < 1) {
                $('.js-review-write').show();
            } else {
                $('.js-review-write').hide();
            }
        });
    },

    showReviewsAction: function (s) {
        var _self = this;

        $.get($('#reviews').data(s), function (result) {
            $('#reviews').html(result);
            if ($('.js-ratingCalc').length > 0) {
                ACC.ratingstars.bindRatingStars();
                _self.showingAllReviews();
            }
        });
    },

    hideReviewBtn: function (btnClass) {
        btnClass = (btnClass === undefined) ? '.less-reviews-btn' : btnClass;
        $(btnClass).hide();
    },

    showReviewBtn: function (btnClass) {
        $(btnClass).show();
    },

    showingAllReviews: function () {
        var isShowingAllReviews = $('#showingAllReviews').data('showingallreviews');
        if (isShowingAllReviews) {
            this.hideReviewBtn('.all-reviews-btn');
        }
    },

    determineToDisplayReviews: function () {
        if (location.hash === '#tabreview') {
            this.showReviewsAction('reviews');
        }
    }

});

$(document).ready(function () {
    new Reviews($('#Reviews-tab')[0]);
});
