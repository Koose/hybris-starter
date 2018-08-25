import Component from '../lib/base/component';
import plugin from '../lib/base/plugin';
import {animateIn, animateOut} from '../utils/animation-utils';
import hoverIntent from 'hoverintent';

class MiniCart extends Component {
    constructor (element, options) {
        super(element, options);

        this._needsRefresh = true;

        const {
            contentEl,
            countEl,
            layerEL,
            triggerEl
        } = this.options.selectors;

        this.$dom = {
            $contentEl: this.$el.find(contentEl),
            $countEl: this.$el.find(countEl),
            $layerEl: this.$el.find(layerEL),
            $triggerEl: this.$el.find(triggerEl)
        };

        this._bindEvents();
        this.refresh();
    }

    /**
     * Gets the current cart count
     * @param count
     * @returns {*}
     */
    getCartCount (count) {
        if (count >= 100) {
            count = '99+';
        } else if (this.options.hideCountIfZero && count === 0) {
            count = '';
        }
        return count;
    }

    /**
     * Opens the mini cart
     */
    open () {
        const { $layerEl } = this.$dom;
        this._getCartView();
        animateIn($layerEl, 'fade');
    }

    /**
     * Closes the mini cart
     */
    close () {
        const { $layerEl } = this.$dom;
        animateOut($layerEl, 'fade');
    }

    /**
     * Refreshes the content of the mini cart
     */
    refresh () {
        this._getCartCount();
        this._getCartView();
    }

    /**
     * Gets the content of the mini cart view
     * @private
     */
    _getCartView () {
        if (this._needsRefresh) {
            $.ajax({
                url: this.options.getViewUrl,
                cache: false,
                type: 'GET'
            }).done((html) => {
                this._needsRefresh = false;
                this.$dom.$layerEl.html(html);

                // Force lazy loaded images
                $(document).trigger('refresh.lazy');
            });
        }
    }

    /**
     * Fetches the cart count
     * @private
     */
    _getCartCount () {
        $.ajax({
            dataType: 'json',
            url: this.options.getCountUrl,
            type: 'GET',
            cache: false
        }).done((json) => {
            const { $countEl } = this.$dom;
            const count = this.getCartCount(json.miniCartCount);

            $countEl.html(count);

            $(document).trigger({
                type: `refreshed.${this.options.cartType}`,
                extra: {
                    count
                }
            });
        });
    }

    /**
     * Binds the necessary events
     * @private
     */
    _bindEvents () {
        $(document).on('refresh.' + this.options.cartType, () => {
            this._needsRefresh = true;
            this._getCartCount();
        });

        $(document).on(this.getEventName('close'), () => {
            this.close();
        });

        hoverIntent(this.el,
            () => {
                this.open();
            },
            () => {
                this.close();
            }
        );
    }
}

MiniCart.DEFAULTS = {
    getViewUrl: null,
    getCountUrl: null,
    removeProductUrl: null,
    cartType: 'standard',
    currentCount: 0,
    hideCountIfZero: true,
    openOnAddToCart: false,
    selectors: {
        contentEl: '.c-mini-cart__content',
        countEl: '.c-mini-cart__count',
        layerEL: '.c-mini-cart__layer',
        triggerEl: '.c-mini-cart__trigger'
    }
};

plugin('MiniCart', MiniCart);
