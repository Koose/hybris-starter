import { submitForm } from 'form-utils';

/**
 * Adds product to the cart through an async form submission
 * @param {*} form - Instance of the html form element
 */
export const addToCart = (form) => {
    return submitForm(form)
        .then(function (response) {
            if (response.ok) {
                $(document).trigger('refresh.standard');
            }
        });
};
