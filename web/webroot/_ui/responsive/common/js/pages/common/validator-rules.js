import $ from 'jquery';

export default function () {
    $.validator.addClassRules({
        // Helper class which requires confirm password to match that of #password input
        'validate-confirm-password': {
            equalTo: '#password'
        },

        // Helper class which requires confirm email to match that of #email input
        'validate-confirm-email': {
            equalTo: '#email'
        },

        // Helper class which requires 1 input of the group before validating true
        'validate-one-required': {
            require_from_group: [1, '.validate-one-required']
        }
    });

    /**
     * Credit Card Month
     * Assures defined month is not a month in the past.
     *
     * @requires year element with 'data-cc-year' attribute value
     */
    $.validator.addMethod('ccmonth', function (value, element) {
        const today = new Date();
        const currentYear = today.getFullYear();
        const currentMonth = today.getMonth() + 1;
        const $yearEl = $(element.getAttribute('data-cc-year'));
        let selectedYear = currentYear;

        if ($yearEl.length > 0) {
            if ($yearEl.val() === '') {
                return true;
            }

            selectedYear = $yearEl.val();
        }

        return (!(value < currentMonth && selectedYear <= currentYear));
    }, ACC.strings['form.validation.message.ccmonth']);

    /**
     * CVV
     * Assures length of CVV matches the requirement of the defined credit card type.
     */
    $.validator.addMethod('cvv', function (value, element) {
        const type = $(element.getAttribute('data-cc-type')).val() || '';

        if (type === 'AMEX' && value.length === 4) {
            return true;
        } else if ((type !== 'AMEX' && type !== '') && value.length === 3) {
            return true;
        }

        return false;
    }, ACC.strings['form.validation.message.cvv']);

    /**
     * Validates that password used matches defined pattern
     * TODO - Update regex to match Hybris out of the box
     */
    $.validator.addMethod('npassword', function (value, element) {
        return /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[-+_!@#$%^&*.,?]).{10,255}$/.test(value);
    }, ACC.strings['form.validation.message.password']);

    /**
     * Date - MM/DD/YYYY
     * Matches date with MM/DD/YYYY pattern
     * TODO - Can likely be pulled out into two - date format and birth date
     */
    $.validator.addMethod('validate-date-mm-dd-yyyy', function (date, element) {
        const datePattern = /^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/([12]\d{3})$/;
        let isDateValid = this.optional(element) || date.match(datePattern);

        // Extra check if birthday is in past and age is less than 150
        if (isDateValid) {
            const dob = date.split('/');
            const dobDate = new Date(dob[2], dob[0] - 1, dob[1]);
            const now = new Date();
            const age = now.getFullYear() - dobDate.getFullYear();
            if (now < dobDate || age > 150) {
                isDateValid = false;
            }
        }

        return isDateValid;
    }, ACC.strings['form.validation.message.date.mm_dd_yyyy']);

    /**
     * Matches US phone number format
     *
     * Where the area code may not start with 1 and the prefix may not start with 1
     * allows '-' or ' ' as a separator and allows parens around area code
     * some people may want to put a '1' in front of their number
     *
     * 1(212)-999-2345 or
     * 212 999 2344 or
     * 212-999-0983
     *
     * but not
     * 111-123-5434
     * and not
     * 212 123 4567
     */
    $.validator.addMethod('phoneUS', function (phoneNumber, element) {
        phoneNumber = phoneNumber.replace(/\s+/g, '');

        return this.optional(element) || (phoneNumber.length > 9 &&
            phoneNumber.match(/^(\+?1-?)?(\([2-9]([02-9]\d|1[02-9])\)|[2-9]([02-9]\d|1[02-9]))-?[2-9]([02-9]\d|1[02-9])-?\d{4}$/));
    }, ACC.strings['form.validation.message.phoneUS']);

    /**
     * Requires X number of inputs from group to be populated.
     *
     * Lets you say "at least X inputs that match selector Y must be filled."
     *
     * The end result is that neither of these inputs:
     *
     * <input class="product-info" name="partnumber">
     * <input class="product-info" name="description">
     *
     * ...will validate unless at least one of them is filled.
     *
     * partnumber: {require_from_group: [1,".product-info"]},
     * description: {require_from_group: [1,".product-info"]}
     *
     * options[0]: number of fields that must be filled in the group
     * options[1]: CSS selector that defines the group of conditionally required fields
     *
     * @see helper class rule .validate-one-required
     */
    $.validator.addMethod('require_from_group', function (value, element, options) {
        const $fields = $(options[ 1 ], element.form);
        const $fieldsFirst = $fields.eq(0);
        const validator = $fieldsFirst.data('valid_req_grp') ? $fieldsFirst.data('valid_req_grp') : $.extend({}, this);
        let isValid = $fields.filter(function () {
            return validator.elementValue(this);
        }).length >= options[ 0 ];

        // Store the cloned validator for future validation
        $fieldsFirst.data('valid_req_grp', validator);

        // If element isn't being validated, run each require_from_group field's validation rules
        if (!$(element).data('being_validated')) {
            $fields.data('being_validated', true);
            $fields.each(function () {
                validator.element(this);
            });
            $fields.data('being_validated', false);
        }
        return isValid;
    }, $.validator.format(ACC.strings['form.validation.message.requiredFromGroup']));
}
