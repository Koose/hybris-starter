const initClasses = ['animate-in', 'animate-out'];
const activeClasses = ['animate-in-active', 'animate-out-active'];

export const animateIn = (element, animation, callback) => {
    animate(true, element, animation, callback);
};

export const animateOut = (element, animation, callback) => {
    animate(false, element, animation, callback);
};

/**
 * Animates an element in or out using a CSS transition class.
 * @function
 * @private
 * @param {Boolean} isIn - Defines if the animation is in or out.
 * @param {Object} element - jQuery or HTML object to animate.
 * @param {String} animation - CSS class to use.
 * @param {Function} callback - Callback to run when animation is finished.
 */
const animate = (isIn, element, animation, cb) => {
    element = $(element).eq(0);

    if (!element.length) return;

    const initClass = isIn ? initClasses[0] : initClasses[1];
    const activeClass = isIn ? activeClasses[0] : activeClasses[1];

    // Set up the animation
    reset();

    element
        .addClass(animation)
        .css('transition', 'none');

    requestAnimationFrame(() => {
        element.addClass(initClass);
        if (isIn) element.show();
    });

    // Start the animation
    requestAnimationFrame(() => {
        // eslint-disable-next-line no-unused-expressions
        element[0].offsetWidth;
        element
            .css('transition', '')
            .addClass(activeClass);
    });

    // Clean up the animation when it finishes
    element.one(transitionEnd(element), finish);

    // Hides the element (for out animations), resets the element, and runs a callback
    function finish () {
        if (!isIn) element.hide();
        reset();
        if (cb) cb.apply(element);
    }

    // Resets transitions and removes motion-specific classes
    function reset () {
        element[0].style.transitionDuration = 0;
        element.removeClass(`${initClass} ${activeClass} ${animation}`);
    }
};

export const transitionEnd = ($elem) => {
    const transitions = {
        'transition': 'transitionend',
        'WebkitTransition': 'webkitTransitionEnd',
        'MozTransition': 'transitionend',
        'OTransition': 'otransitionend'
    };

    const elem = document.createElement('div');
    let end;

    for (let t in transitions) {
        if (typeof elem.style[t] !== 'undefined') {
            end = transitions[t];
        }
    }

    if (end) {
        return end;
    } else {
        end = setTimeout(() => {
            $elem.triggerHandler('transitionend', [$elem]);
        }, 1);

        return 'transitionend';
    }
};
