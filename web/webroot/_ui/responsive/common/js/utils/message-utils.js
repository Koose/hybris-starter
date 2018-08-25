import $ from 'jquery';

const _$globalMsgs = $('#globalMessages');

/**
 * Adds a message to the global messages area. Has option to append or just overwrite.
 * This shortcut methods for this method implementations can be found in:
 * - addError
 * - addSuccess
 *
 * @param type String
 * @param msg String
 * @param append boolean
 */
export const addMessage = (type, msg, append = false, $altMsgContainer) => {
    let message;
    let $appendTo;
    const $msgsCntr = ($altMsgContainer) || _$globalMsgs;

    switch (type) {
    case 'success':
        // Build classes and markup
        message = `<div class="alert alert-success">${msg}</div>`;
        if (append) {
            $appendTo = $msgsCntr.find('.messages .positive').filter(':last-child');
        }
        break;
    case 'error':
        // Build classes and markup
        message = `<div class="alert alert-danger">${msg}</div>`;
        if (append) {
            $appendTo = $msgsCntr.find('.messages .negative').filter(':last-child');
        }
        break;
    default:
        message = `<div class="alert alert-success">${msg}</div>`;
        if (append) {
            $appendTo = $msgsCntr.find('.messages .neutral').filter(':last-child');
        }
        break;
    }

    // If set to append, lets append it to the correct ul list else replace html with new messages
    if (append) {
        if ($appendTo.length) {
            $appendTo.after(message);
        } else {
            $msgsCntr.append(`<div class="messages">${message}</div>`);
        }
    } else {
        // append to where the messages belong.
        $msgsCntr.html(`<div class="messages">${message}</div>`);
    }
};

/**
 * Adds a success message
 *
 * @param msg {String} the message
 * @param append {boolean}
 */
export const addSuccess = (msg, append) => {
    addMessage('success', msg, append);
};

/**
 * Adds an error message
 *
 * @param msg
 * @param append
 */
export const addError = (msg, append) => {
    addMessage('error', msg, append);
};

/**
 * Adds a group of messages formatted in a json object/array
 *
 * @param msgs
 * @returns {string}
 */
export const addMessages = (msgs, type = 'error') => {
    clearMessages();

    if (msgs instanceof Array) {
        for (let i = 0; i < msgs.length; i++) {
            addMessage(type, msgs[i], true);
        }
    } else {
        addMessage(type, msgs, true);
    }
};

/**
 * Clears the Global Messages
 */
export const clearMessages = () => {
    _$globalMsgs.html('');
};
