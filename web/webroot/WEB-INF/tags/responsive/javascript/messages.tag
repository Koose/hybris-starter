<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script type="text/javascript">
    !function($) {
        /**
         * Default messages for the jQuery validation plugin.
         */
        $.extend($.validator.messages, {
            required: ACC.strings['form.validation.message.required'],
            remote: ACC.strings['form.validation.message.remote'],
            email: ACC.strings['form.validation.message.email'],
            url: ACC.strings['form.validation.message.url'],
            date: ACC.strings['form.validation.message.date'],
            dateISO: ACC.strings['form.validation.message.dateISO'],
            number: ACC.strings['form.validation.message.number'],
            digits: ACC.strings['form.validation.message.digits'],
            creditcard: ACC.strings['form.validation.message.creditcard'],
            equalTo: ACC.strings['form.validation.message.equalTo'],
            maxlength: $.validator.format( ACC.strings['form.validation.message.maxlength'] ),
            minlength: $.validator.format( ACC.strings['form.validation.message.minlength'] ),
            rangelength: $.validator.format( ACC.strings['form.validation.message.rangelength'] ),
            range: $.validator.format( ACC.strings['form.validation.message.range'] ),
            max: $.validator.format( ACC.strings['form.validation.message.max'] ),
            min: $.validator.format( ACC.strings['form.validation.message.min'] )
        });
    }(window.jQuery);
</script>
