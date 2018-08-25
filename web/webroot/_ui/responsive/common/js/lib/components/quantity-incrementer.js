import Component from '../base/component';
import plugin from '../base/plugin';

/**
 * A component that provides the functionality to increment / decrement an
 * input's value based on respective increment / decrement controls.
 */
class QuantityIncrementer extends Component {
    constructor (element, options) {
        super(element, options);

        const { increaseQtyEl, decreaseQtyEl } = this.options.selectors;
        this.$dom = {
            incrementEl: this.$el.siblings(increaseQtyEl),
            decrementEl: this.$el.siblings(decreaseQtyEl)
        };

        this._bindEvents();
    }

    increment () {
        let newQty = parseInt(this.$el.val()) + parseInt(this.options.incrementBy);
        const maxQty = parseInt(this.options.max);

        if (newQty >= maxQty) {
            newQty = maxQty;
            this.$dom.incrementEl.prop('disabled', true);
        } else {
            this.$dom.decrementEl.prop('disabled', false);
        }

        this.update(newQty);
    }

    decrement () {
        let newQty = parseInt(this.$el.val()) - parseInt(this.options.incrementBy);
        const minQty = parseInt(this.options.min);

        if (newQty <= minQty) {
            newQty = minQty;
            this.$dom.decrementEl.prop('disabled', true);
        } else {
            this.$dom.incrementEl.prop('disabled', false);
        }

        this.update(newQty);
    }

    update (qty) {
        qty && this.el.val(qty).trigger(this.getEventName('change'));
    }

    destroy () {

    }

    _bindEvents () {
        this.$dom.incrementEl.on('click.increment', () => {
            this.increment();
        });

        this.$dom.decrementEl.on('click.decrement', () => {
            this.decrement();
        });
    }
}

QuantityIncrementer.DEFAULTS = {
    incrementBy: 1,
    min: 1,
    max: null,
    selectors: {
        increaseQtyEl: '.increase-qty',
        decreaseQtyEl: '.decrease-qty'
    }
};

plugin('QuantityIncrementer', QuantityIncrementer);
