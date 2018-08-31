import './polyfills';
import $ from 'jquery';

import Common from './pages/common/common';
import Home from './pages/home/home';
import PLP from './pages/plp/plp';
import PDP from './pages/pdp/pdp';
import StoreFinder from './pages/store-finder/store-finder';

const $body = $('body');

// Maps the page's body class to an instance of a page class
const PageClasses = {
    'page-homepage': Home,
    'page-productGrid': PLP,
    'page-productDetails': PDP,
    'page-storefinderPage': StoreFinder
};

// Bootstraps common logic
new Common();

/**
 * Handles the instantiation of the respective PageClass based
 * on pre-defined body class mapping.
 */
Object.keys(PageClasses).some((key) => {
    if ($body.hasClass(key)) {
        const PageClass = PageClasses[key];
        PageClass && new PageClass();
        return true;
    }
});
