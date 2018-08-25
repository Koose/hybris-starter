import $ from 'jquery';
import 'jquery-validation';

const matchedElements = ['input', 'select', 'textarea'];

// TODO - Export to utils
const getClassNames = (element, regex) => {
    const classList = element.className.split(/\s+/);
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
 * @param {*} formSelector
 * @param {*} initValidator
 */
export const prepareForm = (formSelector, initValidator = true) => {
    const $validateForms = $(formSelector);
    for (let i = 0; i < $validateForms.length; i++) {
        const $form = $($validateForms[i]);

        if (!$form.hasClass('is-prepared')) {
            const $inputs = $form.find(matchedElements.toString());
            const prefix = 'data-rule-';

            for (let j = 0; j < $inputs.length; j++) {
                const input = $inputs[j];
                const classList = getClassNames(input, /\w*validate-\w*/);

                for (let k = 0; k < classList.length; k++) {
                    const split = classList[k].split('-');
                    const rule = split[1] ? split[1] : '';

                    if (rule !== '') {
                        input.setAttribute(prefix + rule, split[2] || true);
                    }
                }
            }

            $form.addClass('is-prepared');
            initValidator && $form.validate(); // Init jQuery Validate
        }
    }
};

export const submitForm = (form, options) => {
    const $form = $(form);

    if ($form.length > 0) {
        const defaults = {
            url: $form.prop('action'),
            method: $form.prop('method') || 'POST',
            formData: $form.serialize()
        };
        const opts = $.extend({}, defaults || {});

        // TODO: Create util that will handle making requests
        return fetch(opts.url, {
            method: opts.method,
            body: opts.formData,
            credentials: 'same-origin',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            }
        });
    } else {
        return new Promise();
    }
};

/**
 * Enables form validation on forms with the class of 'validate-form'
 */
export const enableFormValidation = () => {
    prepareForm($('.validate-form'));
};
