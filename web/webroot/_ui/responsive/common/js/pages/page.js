import $ from 'jquery';

class PageClass {
    constructor () {
        this.$dom = { body: $('body') };
        this._bindEvents && this._bindEvents(this.$dom.body);
    }

    _bindEvents ($body) {}
}

export default PageClass;
