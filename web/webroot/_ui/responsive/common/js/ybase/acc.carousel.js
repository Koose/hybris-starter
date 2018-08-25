// Deprecated
ACC.carousel = {

    _autoload: [
        ['bindCarousel', $('[data-action="init-carousel"]').length > 0],
        'bindJCarousel'
    ],

    carouselConfig: {
        'default': {
            dots: false,
            responsive: [
                {
                    breakpoint: 1400,
                    settings: {
                        slidesToShow: 7,
                        slidesToScroll: 1
                    }
                },
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 5,
                        slidesToScroll: 1
                    }
                },
                {
                    breakpoint: 640,
                    settings: {
                        slidesToShow: 4,
                        slidesToScroll: 1
                    }
                },
                {
                    breakpoint: 0,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 1
                    }
                }
            ]
        },
        'rotating-image': {
            arrows: false,
            dots: true
        },
        'lazy-reference': {
            dots: false,
            responsive: [
                {
                    breakpoint: 5000,
                    settings: {
                        slidesToShow: 7,
                        slidesToScroll: 1
                    }
                },
                {
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 5,
                        slidesToScroll: 1
                    }
                },
                {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 4,
                        slidesToScroll: 1
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 1
                    }
                }
            ],
            lazyLoad: 'ondemand'
        }
    },

    bindCarousel: function () {
        $('[data-action="init-carousel"]').each(function () {
            var $c = $(this);
            $.each(ACC.carousel.carouselConfig, function (key, config) {
                if ($c.hasClass('slick-' + key)) {
                    var $e = $('.slick-' + key);
                    $e.slick(config);
                }
            });
        });
    },

    bindJCarousel: function () {
        $('.svw').each(function () {
            $(this).waitForImages(function () {
                $(this).slideView({toolTip: true, ttOpacity: 0.6, autoPlay: true, autoPlayTime: 8000});
            });
        });
    }

};
