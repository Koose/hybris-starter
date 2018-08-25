import * as utils from './utils';

/**
 * Respond.to.js
 *
 * Lightweight javascript library to help facilitate javascript development
 * for responsive development. Implements simple api to call, retrieve, and
 * add callbacks to a stack of media query objects.
 *
 * Stack object looks like the following:
 * array(
 *  '960' : array(object, object),
 *  '760' : array(object, object)
 * ));
 *
 * There's 2 ways to use RespondTo
 *
 * new RespondTo([
 *  '960' : array(object, object),
 *  '760' : array(object, object)
 * ])
 *
 * OR/AND
 *
 * const respondTo = new RespondTo();
 *
 * respondTo.to([
 *  '960' : array(object, object),
 *  '760' : array(object, object)
 * ])
 *
 */

class RespondTo {
    /**
     * Constructor
     *
     * @param obj Array || Object (optional)
     */
    constructor (obj) {
        this.window = window;

        if (typeof obj !== 'undefined') {
            this.to(obj);
        }
    }

    /**
     * Pushes a new object based on a key onto the media stack
     *
     * @param mqString String
     * @param obj Object
     * @return {*}
     * @private
     */
    _push (mqString, obj) {
        const key = utils.purify(mqString);
        this._mediaStack || (this._mediaStack = {});
        this._mediaStack[key] || (this._mediaStack[key] = {mql: null, items: []});

        if (!this._mediaStack[key].mql) {
            if (this.window.matchMedia) {
                this._mediaStack[key].mql = this.window.matchMedia(mqString);
                this._mediaStack[key].mql.addListener((mql) => this.respondTo(mql));
            } else {
                this._mediaStack[key].mql = {keyValue: null}; // ie8 fix
            }

            /**
             * Store array key on the mql object for lookup later because of an
             * inconsistency with how browsers handle media queries after instantiation:
             * screen and (min-width: 700px) and (max-width: 900px)
             * is converted to the following on the mql object:
             * screen and (max-width: 900px) and (min-width: 700px)
             */
            this._mediaStack[key].mql.keyValue = key;
        }

        obj.ready = true;
        this._mediaStack[key].items.push(obj);
        return this;
    }

    /**
     * Proxy function for adding listener to media query list.
     *
     * @param mql window.MediaQueryList
     */
    respondTo (mql) {
        this._respond(mql);
    }

    /**
     * Responds to a given media query list object
     *
     * @private
     * @param mql window.MediaQueryList
     * @param namespace String
     */
    _respond (mql, namespace) {
        let key = mql.keyValue || mql.target.keyValue;

        // ie9 can't store extra data on the mql object, so we purify the mql.media string
        if (navigator.userAgent.match(/MSIE 9.0/)) {
            key = utils.purify(mql.media);
        }

        if (!this._mediaStack[key]) return;

        const _fnCallback = mql.matches ? 'if' : 'else';

        for (let i = 0; i < this._mediaStack[key].items.length; i++) {
            const _item = this._mediaStack[key].items[i];

            if (typeof _item[_fnCallback] === 'function') {
                if (!namespace || _item['namespace'] === namespace) {
                    _item[_fnCallback]();
                }
            }
        }
        return this;
    }

    /**
     * Returns a object based on a namespace and an optional
     * media index.
     *
     * @param ns String
     * @param mqString String
     * @return {*}
     * @private
     */
    _retrieve (ns, mqString) {
        if (!this._mediaStack) return;

        let _temp = [];

        if (!mqString) {
            for (const key in this._mediaStack) {
                for (let i = 0; i < this._mediaStack[key].items.length; i++) {
                    _temp.push(this._mediaStack[key].items[i]);
                }
            }
        } else {
            const key = utils.purify(mqString);
            if (!this._mediaStack[key]) return;
            _temp = this._mediaStack[key].items;
        }

        // find namespace
        for (let i = 0; i < _temp.length; i++) {
            if (_temp[i].namespace === ns) {
                return _temp[i];
            }
        }
    }

    /**
     * Adds the corresponding object to the media stack
     *
     * @param obj Object
     * @return {*}
     */
    to (obj) {
        if (typeof obj !== 'undefined') {
            if (obj.length) {
                for (let i = 0; i < obj.length; i++) {
                    this.to(obj[i]);
                }
            } else {
                let _temp = this._retrieve(obj.namespace, obj.media);

                if (typeof _temp === 'undefined') {
                    _temp = this._push(obj.media, obj)._retrieve(obj.namespace, obj.media);

                    if (_temp.ready && typeof _temp !== 'undefined') {
                        this._respond(this._mediaStack[utils.purify(obj.media)].mql, obj.namespace);
                        _temp.ready = false;
                    }
                }
            }
        } else {
            console.error('Parameter can\' be empty');
        }

        return this;
    }

    /**
     * Must be called to mark all ready and to make the initial
     * media respond call.
     */
    ready () {
        for (const key in this._mediaStack) {
            this._respond(this._mediaStack[key].mql);
        }
        return this;
    }

    /**
     * Returns the media stack object
     *
     * @param mqString String
     * @return {*}
     */
    getStack (mqString) {
        return this._mediaStack[utils.purify(mqString)] || this._mediaStack;
    }

    /**
     * Removes a objects from the media stack
     *
     * @param mqString String
     * @param ns String (optional)
     * @return {*}
     */
    remove (mqString, ns) {
        const key = utils.purify(mqString);

        if (!this._mediaStack.length && !this._mediaStack[key]) return;

        if (!ns) {
            this._mediaStack[key].mql.removeListener((mql) => this.respondTo(mql));
            delete this._mediaStack[key];
            return this;
        }

        for (var i = 0; i < this._mediaStack[key].items.length; i++) {
            if (this._mediaStack[key].items[i].namespace === ns) {
                delete this._mediaStack[key].items[i];
                this._mediaStack[key].items.splice(i, 1);
            }
        }
        return this;
    }

    /**
     * Calls a specific ns, type, media reference
     *
     * @param ns String
     * @param type String
     * @param mqString String (optional)
     * @return {*}
     */
    call (ns, type, mqString) {
        try {
            if (mqString && type) {
                (this._retrieve(ns, mqString))[type](this);
            } else if (type) {
                (this._retrieve(ns))[type](this);
            } else {
                this._respond(this._mediaStack[utils.purify((this._retrieve(ns)).media)].mql, ns);
            }
        } catch (e) {
            console.error(e);
        }
        return this;
    }
}

export default RespondTo;
