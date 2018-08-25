import $ from 'jquery';

class Component {
    constructor (element, options) {
        this.namespace = this.constructor.name;
        this.options = options;
        this.el = element;
        this.$el = $(element);
        this.$dom = {};
    }

    _bindEvents () {

    }

    getEventName (event) {
        return `${event}.${this.namespace}`;
    }

    reset () {

    }

    destroy () {

    }
}

/**
 * Default Options
 */
Component.DEFAULTS = {
    'prefixClass': 'gor-'
};

export default Component;
