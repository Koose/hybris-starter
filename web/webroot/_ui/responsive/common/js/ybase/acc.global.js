ACC.global = {

    _autoload: [
        ['passwordStrength', $('.password-strength').length > 0],
        'bindToggleOffcanvas',
        'bindToggleXsSearch',
        'bindHoverIntentMainNavigation',
        'backToHome',
        'bindDropdown',
        'closeAccAlert'
    ],

    passwordStrength: function () {
        $('.password-strength').pstrength({
            verdicts: [ACC.pwdStrengthTooShortPwd,
                ACC.pwdStrengthVeryWeak,
                ACC.pwdStrengthWeak,
                ACC.pwdStrengthMedium,
                ACC.pwdStrengthStrong,
                ACC.pwdStrengthVeryStrong],
            minCharText: ACC.pwdStrengthMinCharText
        });
    },

    bindToggleOffcanvas: function () {
        $(document).on('click', '.js-toggle-sm-navigation', function () {
            ACC.global.toggleClassState($('main'), 'offcanvas');
            ACC.global.toggleClassState($('html'), 'offcanvas');
            ACC.global.toggleClassState($('body'), 'offcanvas');
            ACC.global.resetXsSearch();
        });
    },

    bindToggleXsSearch: function () {
        $(document).on('click', '.js-toggle-xs-search', function () {
            ACC.global.toggleClassState($('.site-search'), 'active');
            ACC.global.toggleClassState($('.js-mainHeader .navigation--middle'), 'search-open');
        });
    },

    resetXsSearch: function () {
        $('.site-search').removeClass('active');
        $('.js-mainHeader .navigation--middle').removeClass('search-open');
    },

    toggleClassState: function ($e, c) {
        $e.hasClass(c) ? $e.removeClass(c) : $e.addClass(c);
        return $e.hasClass(c);
    },

    bindHoverIntentMainNavigation: function () {
        // TODO - Let's revisit in scope of ES6 migration
        /* Respond.to({
            'media': '(min-width:' + screenMdMin + ')',
            'namespace': 'acc_global',
            'fallback': 'else',
            'if': function () {
                // on screens larger or equal screenMdMin (1024px) calculate position for .sub-navigation
                $('.js-enquire-has-sub').hoverIntent(function () {
                    var $this = $(this);
                    var itemWidth = $this.width();
                    var $subNav = $this.find('.js_sub__navigation');
                    var subNavWidth = $subNav.outerWidth();
                    var $mainNav = $('.js_navigation--bottom');
                    var mainNavWidth = $mainNav.width();

                    console.log($subNav);

                    // get the left position for sub-navigation to be centered under each <li>
                    var leftPos = $this.position().left + itemWidth / 2 - subNavWidth / 2;
                    // get the top position for sub-navigation. this is usually the height of the <li> unless there is more than one row of <li>
                    var topPos = $this.position().top + $this.height();

                    if (leftPos > 0 && leftPos + subNavWidth < mainNavWidth) {
                        // .sub-navigation is within bounds of the .main-navigation
                        $subNav.css({
                            'left': leftPos,
                            'top': topPos,
                            'right': 'auto'
                        });
                    } else if (leftPos < 0) {
                        // .suv-navigation can't be centered under the <li> because it would exceed the .main-navigation on the left side
                        $subNav.css({
                            'left': 0,
                            'top': topPos,
                            'right': 'auto'
                        });
                    } else if (leftPos + subNavWidth > mainNavWidth) {
                        // .suv-navigation can't be centered under the <li> because it would exceed the .main-navigation on the right side
                        $subNav.css({
                            'right': 0,
                            'top': topPos,
                            'left': 'auto'
                        });
                    }
                    $this.addClass('show-sub');
                }, function () {
                    $(this).removeClass('show-sub');
                });
            },
            'else': function () {
                // on screens smaller than screenMdMin (1024px) remove inline styles from .sub-navigation and remove hoverIntent
                $('.js_sub__navigation').removeAttr('style');
                $('.js-enquire-has-sub').hoverIntent(function () {
                    // unbinding hover
                });
            }
        }); */
    },

    reprocessImages: function (elems) {
        elems = elems || '.js-responsive-image';
        if (this.imgr === undefined) {
            this.initImager(elems);
        } else {
            this.imgr.checkImagesNeedReplacing($(elems));
        }
    },

    // usage: ACC.global.addGoogleMapsApi("callback function"); // callback function name like "ACC.global.myfunction"
    addGoogleMapsApi: function (callback) {
        if (callback !== undefined && $('.js-googleMapsApi').length === 0) {
            $('head').append('<script class="js-googleMapsApi" type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=' + ACC.config.googleApiKey + '&sensor=false&callback=' + callback + '"></script>');
        } else if (callback !== undefined) {
            eval(callback + '()'); // eslint-disable-line no-eval
        }
    },

    backToHome: function () {
        $('.backToHome').on('click', function () {
            var sUrl = ACC.config.contextPath;
            window.location = sUrl;
        });
    },

    bindDropdown: function () {
        $(document).on('click', '.dropdown-toggle', dropdownToggle);
    },

    closeAccAlert: function () {
        $('.closeAccAlert').on('click', function () {
            $(this).parent('.getAccAlert').remove();
        });
    }

};

// ***** Dropdown begins *****
function dropdownParent ($this) {
    var selector = $this.attr('href');
    selector = selector && /#[A-Za-z]/.test(selector) && selector.replace(/.*(?=#[^\s]*$)/, ''); // strip for ie7

    var $parent = selector && $(selector);

    return $parent && $parent.length ? $parent : $this.parent();
}

function dropdownClearMenus (e) {
    // if right click, exit
    if (e && e.which === 3) return;

    // remove class added on dropdownToggle
    $('.dropdown-backdrop').remove();

    $('.dropdown-toggle').each(function () {
        var $parent = dropdownParent($(this));

        if (!$parent.hasClass('open')) return;

        if (e && e.type === 'click' && /input|textarea/i.test(e.target.tagName) && $.contains($parent[0], e.target)) return;

        $parent.removeClass('open');
    });
}

function dropdownToggle (e) {
    var $this = $(this);

    if ($this.is('.disabled, :disabled')) return;

    var $parent = dropdownParent($this);
    var isActive = $parent.hasClass('open');

    dropdownClearMenus();

    if (!isActive) {
        if ('ontouchstart' in document.documentElement && !$parent.closest('.navbar-nav').length) {
            // if mobile we use a backdrop because click events don't delegate
            $(document.createElement('div'))
                .addClass('dropdown-backdrop')
                .insertAfter($(this))
                .on('click', dropdownClearMenus);
        }

        if (e.isDefaultPrevented()) return;

        // expand the <ul> on the dropdown
        $this
            .trigger('focus')
            .attr('aria-expanded', 'true');

        // set parent to open
        $parent.toggleClass('open');
    }

    return false;
}

//* **** Dropdown ends *****
