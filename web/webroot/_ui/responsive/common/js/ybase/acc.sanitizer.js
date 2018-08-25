/*
    @deprecated
    @see https://github.com/punkave/sanitize-html
 */
ACC.sanitizer = {
    matcher: /<\/?([a-zA-Z0-9]+)*(.*?)\/?>/igm,

    whitelist: [
        'pre',
        'address',
        'em',
        'hr'
    ],

    sanitize: function (html, useWhitelist) {
        html = String(html) || '';
        var matches = ACC.sanitizer.match(html);
        useWhitelist = (typeof useWhitelist === 'undefined') ? true : useWhitelist;
        matches.forEach(function (tag) {
            if (!useWhitelist || ACC.sanitizer.whitelist.indexOf(tag.name) === -1) {
                html = html.replace(tag.full, '');
            }
        });

        return html;
    },

    match: function (html) {
        html = String(html) || '';

        var matches = [];
        var match;

        while ((match = ACC.sanitizer.matcher.exec(html)) != null) {
            var attrr = match[2].split(' ');
            var attrs = [];

            // extract attributes from the tag
            attrr.shift();
            attrr.forEach(function (attr) {
                attr = attr.split('=');
                var attrName = attr[0];
                var attrVal = attr.length > 1 ? attr.slice(1).join('=') : null;
                // remove quotes from attributes
                if (attrVal && attrVal.charAt(0).match(/'|"/)) attrVal = attrVal.slice(1);
                if (attrVal && attrVal.charAt(attrVal.length - 1).match(/'|"/)) attrVal = attrVal.slice(0, -1);
                attr = {
                    name: attrName,
                    value: attrVal
                };
                if (!attr.value) delete attr.value;
                if (attr.name) attrs.push(attr);
            });

            var tag = {
                full: match[0],
                name: match[1],
                attr: attrs
            };

            matches.push(tag);
        }

        return matches;
    }
};
