import $ from 'jquery';
import Vue from 'vue';

/**
 * A dialog modal component that builds on top of Bootstrap's modal component
 */
class Dialog {
    constructor (options) {
        this.namespace = this.constructor.name;
        this.options = $.extend({}, Dialog.DEFAULTS, typeof options === 'object' && options);
        const $template = $($(this.options.template).html()).appendTo('body');
        this.vm = this._getVueInstance($template[0]);

        this.$el = $(`#${this.options.id}`);
        this.el = this.$el[0];

        this._bindEvents();
        this.open();
    }

    /**
     * Opens the dialog modal
     */
    open () {
        this.$el.modal('show');
    }

    /**
     * Closes the dialog modal
     */
    close () {
        this.$el.modal('hide');
        this._destroy();
    }

    /**
     * Handles the confirmation of the dialog modal
     */
    confirm () {
        const { onConfirm } = this.options;
        if (typeof onConfirm === 'function') {
            onConfirm().then(this.close());
        } else {
            this.close();
        }
    }

    /**
     * Handles the dismissal of the dialog modal
     */
    cancel () {
        const { onCancel } = this.options;
        if (typeof onCancel === 'function') {
            onCancel().then(this.close());
        } else {
            this.close();
        }
    }

    /**
     * Gets instance of Vue object
     * @param el
     * @returns Vue Object
     * @private
     */
    _getVueInstance (el) {
        return new Vue({
            el: el,
            data: {
                ...this.options
            }
        });
    }

    /**
     * Destroys the dialog modal
     * @private
     */
    _destroy () {
        this.$el.modal('dispose').remove();
    }

    /**
     * Handles the binding of necessary events
     * @private
     */
    _bindEvents () {
        this.$el.on(`click.${this.namespace}`, '[data-dialog="close"]', () => {
            this.close();
        });

        this.$el.on(`click.${this.namespace}`, '[data-dialog="cancel"]', () => {
            this.cancel();
        });

        this.$el.on(`click.${this.namespace}`, '[data-dialog="confirm"]', () => {
            this.confirm();
        });
    }
}

Dialog.DEFAULTS = {
    id: 'js-dialog',
    template: '#dialog-template',
    type: 'confirm', // confirm, alert & prompt
    onCancel: null,
    onConfirm: null,
    strings: {
        title: ACC.strings['dialog.title'],
        description: ACC.strings['dialog.description'],
        inputLabel: ACC.strings['dialog.input.label'],
        inputPlaceholder: ACC.strings['dialog.input.placeholder'],
        cancelBtnLabel: ACC.strings['dialog.button.cancel'],
        confirmBtnLabel: {
            alert: ACC.strings['dialog.button.confirm'],
            prompt: ACC.strings['dialog.button.confirm'],
            confirm: ACC.strings['dialog.button.confirm']
        }
    }
};

export default Dialog;
