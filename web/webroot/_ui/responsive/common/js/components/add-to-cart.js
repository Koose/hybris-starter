import Component from '../lib/base/component';
import plugin from '../lib/base/plugin';
import {submitForm} from '../utils/form-utils';

class AddToCart extends Component {
    constructor (element, options) {
        super(element, options);

        const {
            addButtonEl,
            formEl,
            miniCartEl,
            modalEl
        } = this.options.selectors;

        this.$dom = {
            $addButtonEl: this.$el.find(addButtonEl),
            $form: this.$el.find(formEl),
            $miniCartEl: this.$el.find(miniCartEl),
            $modalEl: this.$el.find(modalEl)
        };
        this.strings = this.options.strings;

        this._bindEvents();
    }

    _onSubmit () {
        const { $form } = this.$dom;

        if ($form.valid()) {
            this._setAddToCartBtnState('adding');

            submitForm($form)
                .then((response) => {
                    return response.json();
                }).then((json) => {
                    this._setAddToCartBtnState('added');
                    this._onSuccess(json);
                });
        }
    }

    _setAddToCartBtnState (state) {
        const { $addButtonEl } = this.$dom;
        const { add, adding, added } = this.strings;

        switch (state) {
            case 'adding':
                $addButtonEl.addClass('is-adding').prop('disabled', true)
                    .text(adding);
                break;
            case 'added':
                $addButtonEl.removeClass('is-adding').prop('disabled', false)
                    .addClass('is-added')
                    .text(added);
                break;
            default:
                $addButtonEl.removeClass('is-added is-adding').text(add);
                break;
        }
    }

    _onSuccess (data) {
        switch (this.options.displayOnAdd) {
            case 'modal':
                this._showAddToCartModal(data);
                break;
            case 'minicart':
                this._showMiniCart();
                break;
        }

        // Reset Add to cart Btn state
        setTimeout(() => this._setAddToCartBtnState('refresh'), 500);

        // Close Add to Cart Modal/Minicart if there is a duration
        if (this.options.displayDuration && this.options.displayDuration !== 0) {
            setTimeout(() => this._closeAfterDuration('refresh'), this.options.displayDuration);
        }
        $(document).trigger('refresh.standard');
    }

    _onError () {

    }

    _showAddToCartModal (data) {
        const { modalEl } = this.options.selectors;
        // Remove previous instance
        $(modalEl).remove();

        // Add new instance and open
        $(data.addToCartLayer).appendTo('body').modal('show');

        // Lazy load images in modal
        $(document).trigger('refresh.lazy');
    }

    _showMiniCart () {

    }

    _closeAfterDuration () {
        if (this.options.displayDuration && this.options.displayDuration !== 0) {
            switch (this.options.displayOnAdd) {
                case 'modal':
                    const { modalEl } = this.options.selectors;

                    // Close Modal
                    $(modalEl).modal('hide');
                    break;
                case 'minicart':
                    // Close MiniCart
                    $(document).trigger('close.MiniCart');
                    break;
            }
        }
    }

    _bindEvents () {
        const { $form } = this.$dom;

        $form.on(this.getEventName('submit'), (e) => {
            e.preventDefault();

            this._onSubmit();
        });
    }
}

AddToCart.DEFAULTS = {
    displayOnAdd: 'modal', // 'modal' or 'cart'
    displayDuration: 3000, // set to 5000 to close the minicart or modal after the duration
    selectors: {
        addButtonEl: '.c-add-to-cart__button',
        formEl: '.c-add-to-cart__form',
        miniCartEL: '',
        modalEl: '[data-role="c-cart-modal"]'
    },
    strings: {
        add: ACC.strings['basket.add.to.basket'],
        adding: ACC.strings['basket.adding.to.basket'],
        added: ACC.strings['basket.add.done.to.basket']
    }
};

plugin('AddToCart', AddToCart);
