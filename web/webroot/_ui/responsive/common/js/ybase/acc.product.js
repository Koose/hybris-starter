// Shared logic or contextual logic or both? Does it need to be isolated?
ACC.product = {

    _autoload: [
        'bindToAddToCartForm',
        'enableStorePickupButton',
        'enableVariantSelectors',
        'bindFacets'
    ],

    bindFacets: function () {
        $(document).on('click', '.js-show-facets', function (e) {
            e.preventDefault();
            var $modal = $('.c-product-facet');
            $modal.modal('show');
        });

        $(document).on('click', '.js-product-facet .js-facet-name', function (e) {
            e.preventDefault();
            $('.js-product-facet  .js-facet').removeClass('active');
            $(this).parents('.js-facet').addClass('active');
        });

        // TODO - REvisit in ES6
        /* Respond.to({
            'media': '(min-width:' + screenSmMax + ')',
            'namespace': 'acc_product',
            'fallback': 'else',
            'if': function () {
                var $modal = $('.c-product-facet');
                $modal.modal('hide');
            },
            'else': function () {

            }
        }); */
    },

    enableAddToCartButton: function () {
        $('.js-enable-btn').each(function () {
            if (!($(this).hasClass('outOfStock') || $(this).hasClass('out-of-stock'))) {
                $(this).prop('disabled', false);
            }
        });
    },

    enableVariantSelectors: function () {
        $('.variant-select').prop('disabled', false);
    },

    bindToAddToCartForm: function () {
        var addToCartForm = $('.add_to_cart_form');
        addToCartForm.ajaxForm({
            beforeSubmit: ACC.product.showRequest,
            success: ACC.product.displayAddToCartPopup
        });
        setTimeout(function () {
            ACC.product.$ajaxCallEvent = true;
        }, 2000);
    },
    showRequest: function (arr, $form, options) {
        if (ACC.product.$ajaxCallEvent) {
            ACC.product.$ajaxCallEvent = false;
            return true;
        }
        return false;
    },

    bindToAddToCartStorePickUpForm: function () {
        var addToCartStorePickUpForm = $('.modal #add_to_cart_storepickup_form');
        addToCartStorePickUpForm.ajaxForm({success: ACC.product.displayAddToCartPopup});
    },

    enableStorePickupButton: function () {
        $('.js-pickup-in-store-button').prop('disabled', false);
    },

    displayAddToCartPopup: function (cartResult, statusText, xhr, formElement) {
        ACC.product.$ajaxCallEvent = true;
        $('#addToCartLayer').remove();
        // Refresh minicart
        $(document).trigger('refresh.standard');

        var productCode = $('[name=productCodePost]', formElement).val();
        var quantityField = $('[name=qty]', formElement).val();

        var quantity = 1;
        if (quantityField !== undefined) {
            quantity = quantityField;
        }

        var cartAnalyticsData = cartResult.cartAnalyticsData;

        var cartData = {
            'cartCode': cartAnalyticsData.cartCode,
            'productCode': productCode,
            'quantity': quantity,
            'productPrice': cartAnalyticsData.productPostPrice,
            'productName': cartAnalyticsData.productName
        };
        ACC.track.trackAddToCart(productCode, quantity, cartData);
    }
};

$(document).ready(function () {
    ACC.product.$ajaxCallEvent = true;
    ACC.product.enableAddToCartButton();
});
