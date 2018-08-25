import $ from 'jquery';

const $pageLoader = $('#js-global-loader');

export const getClassNames = (el, regex) => {
    const classList = el.className.split(/\s+/);
    for (let i = 0; i < classList.length; i++) {
        if (!classList[i].match(regex)) {
            classList.splice(i, 1);
            i--;
        }
    }

    return classList;
};

/**
 *
 * utils to show/hide a loader
 * @param enabled
 * @param loader
 * @param button
 */
export const setLoadingState = (enabled, loader, button) => {
    const $button = button ? $(button) : null;
    const $loader = loader ? $(loader) : $pageLoader;

    if ($loader) {
        $loader.css('display', enabled ? 'block' : 'none');
    }

    if ($button) {
        $button.prop('disabled', enabled);
    }
};

export const getUrl = (url) => {
    return ACC.config.encodedContextPath + url;
};

/**
 * util that adds a show more/less button depending on a list on items
 * @param btn
 * @param item
 * @param counter
 */
export const showMore = (btn, item, counter) => {
    const $item = $(item);
    const $btn = $(btn);

    $item.slice(0, counter).show();
    const items = $item.length;
    let shown = counter;

    if (items < counter) {
        $btn.hide();
    }

    $btn.click(function (e) {
        e.preventDefault();
        var $this = $(this);
        shown = $item.filter(':visible').size() + counter;
        if (shown < items) {
            $item.slice(0, shown).show();
        } else {
            $item.slice(0, items).show();
            $this.hide();
        }
    });
};

/**
 * Scrolls to a specific object in the DOM
 *
 * @param $container
 * @param duration
 */
export const scrollToDiv = ($container, duration) => {
    duration || (duration = 300);
    $('html, body').animate({scrollTop: $container.offset().top}, duration);
};

/**
 * Util that refresh the form token
 * @param form
 */
export const refreshToken = (form) => {
    const tokenUrl = ACC.config.encodedContextPath + '/authentication/csrftoken';

    fetch(tokenUrl, {
        credentials: 'same-origin',
        method: 'GET'
    }).then(function (response) {
        return response.text();
    }).then(function (html) {
        const token = JSON.parse(html);
        ACC.config.CSRFToken = token;
        form.find('input[name="CSRFToken"]').val(token);
        form.addClass('token-refreshed');
        form.submit();
    });
};

/**
 * Cleans keys for object index by replacing the spaces
 * with a more acceptable character
 *
 * @param key
 * @param replacement (optional)
 * @returns {string}
 */
export const purify = (key, replacement) => {
    replacement || (replacement = '_');
    return key.toLowerCase().replace(/[\s\-:()]/g, replacement).replace(/__/g, replacement).replace(/(_)$/, '');
};
