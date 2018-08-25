import $ from 'jquery';
import LazyLoad from 'vanilla-lazyload';

import PageClass from '../page';
import validatorRules from './validator-rules';
import '../../components/mini-cart';
import '../../components/add-to-cart';
import {LAZY_SETTINGS} from '../../config';
import {enableFormValidation} from '../../utils/form-utils';

/* $(document).on('submit', '.add-to-cart-form', function (e) {
    e.preventDefault();
    _self.addToCart(this);
}); */

class Common extends PageClass {
    constructor () {
        super();

        this._bindEvents();
    }

    _onPageReady () {
        // Insert validation rules
        validatorRules();
        // Enable form validation
        enableFormValidation();
        // enable lazy load images
        this._enableLazyLoadedAssets();
    }

    _enableLazyLoadedAssets () {
        const lazyAssets = new LazyLoad(LAZY_SETTINGS);

        $(document).on('refresh.lazy', function () {
            lazyAssets.update();
        });
    }

    _onLoad () {
        // TODO
    }

    _bindEvents () {
        // TODO - this can likely go into a header class within common directory
        $('.c-mini-cart').MiniCart();

        $(document).ready(() => {
            this._onPageReady();
        });

        $('.c-add-to-cart').AddToCart();
    }
}

export default Common;
