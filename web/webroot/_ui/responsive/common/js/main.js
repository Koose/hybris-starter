// TODO - To be re-factored into global scripts

$(document).ready(function () {
    if (window.matchMedia('screen').matches) {
        // eslint-disable-next-line no-undef
        AOS.init({
            duration: 400,
            easing: 'ease-out-sine',
            offset: 50,
            disable: 'mobile'
            // once: true
        });
    }

    /**
     * Lazy Load Initialization
     */
    window.lazySettings = {
        elements_selector: '.lazy',
        threshold: 500
    };

    // Init LazyLoad
    // eslint-disable-next-line no-undef
    var globalLazy = new LazyLoad(window.lazySettings);

    $(document).on('refresh.lazy', function () {
        globalLazy.update();
    });

    $(document).on('refresh.aos', function () {
        // eslint-disable-next-line no-undef
        AOS.refresh();
    });

    $(window).on('load', function () {
        // eslint-disable-next-line no-undef
        AOS.refresh();
    });

    window.onbeforeprint = function () {
        $(document).trigger('refresh.lazy');
    };

    /**
     * Init of datepicker and making calendar icon trigger datepicker
     */
    var $datepicker = $('.datepicker');
    if ($datepicker.length > 0) {
        var $datepickerField = $('.datepicker-field');
        $datepicker.datepicker({
            maxDate: new Date(),
            dateFormat: 'yy-mm-dd'
        });

        $datepickerField.on('click', '.icon-calendar', function () {
            $(this).parent('.datepicker-field').find('input').focus();
        });
    }

    $('body').on('click', function (e) { // hide any open popovers when the user clicked anywhere else in the body
        if ($(e.target).data('toggle') !== 'popover' &&
            $(e.target).parents('[data-toggle="popover"]').length === 0 &&
            $(e.target).parents('.popover.show').length === 0) {
            $('[data-toggle="popover"]').popover('hide');
        }
    });
});

(function initProductsSlider () {
    var productSlider = $('.carousel__component--carousel');

    productSlider.slick({
        slidesToShow: 6,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 1200,
                settings: {
                    slidesToShow: 5,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 4,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 640,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            }
        ]
    });
}());

(function initProductSlider () {
    var $productDetailSlider = $('[data-action="slide-product"]');
    var $imageGallery = $('[data-action="slide-image-gallery"]');

    $productDetailSlider.slick({
        dots: false,
        lazyLoad: 'ondemand'
    });

    $imageGallery.slick({
        dots: false,
        lazyLoad: 'ondemand',
        slidesToShow: 5,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 1200,
                settings: {
                    slidesToShow: 4,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1
                }
            }
        ]
    });

    $imageGallery.on('click', 'a.item', function (e) {
        e.preventDefault();
        $productDetailSlider.slick('slickGoTo', $(this).data('slick-index'));
    });
}());
