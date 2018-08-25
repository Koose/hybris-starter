// Garbage :) - Likely archived for reference
ACC.multidgrid = {

    populateAndShowGridOverlay: function (element, event) {
        event.preventDefault();

        var itemIndex = $(element).data('index');
        var gridEntries = $('#grid' + itemIndex);

        var strSubEntries = gridEntries.data('sub-entries');
        var productName = gridEntries.data('product-name');
        var arrSubEntries = strSubEntries.split(',');
        var firstVariantCode = arrSubEntries[0].split(':')[0];

        var targetUrl = gridEntries.data('target-url') + '?productCode=' + firstVariantCode;
        var $modal = $('#modal-checkout-item-detail');
        var $modalContent = $modal.find('.modal-body');
        var $modalTitle = $modal.find('.modal-title');

        $.ajax({
            url: targetUrl,
            cache: false,
            type: 'GET'
        }).done(function (data) {
            $modalContent.html(data);
            $modalTitle.html(productName);
            $modal.modal('show');
        });
    },

    populateAndShowGrid: function (element, event, readOnly) {
        var itemIndex = $(element).data('index');
        var grid = $('#ajaxGrid' + itemIndex);
        var gridEntries = $('#grid' + itemIndex);

        $(element).toggleClass('open');

        if (!grid.is(':hidden')) {
            grid.slideUp();
            return;
        }

        if (grid.html() !== '') {
            grid.slideToggle('slow');
            return;
        }

        var strSubEntries = gridEntries.data('sub-entries');
        var arrSubEntries = strSubEntries.split(',');
        var firstVariantCode = arrSubEntries[0].split(':')[0];

        var targetUrl = gridEntries.data('target-url');

        var method = 'GET';
        $.ajax({
            url: targetUrl,
            data: {productCode: firstVariantCode},
            type: method,
            success: function (data) {
                grid.html(data);
                grid.slideDown('slow');
            },
            error: function (xht, textStatus, ex) {
                alert('Failed to get variant matrix. Error details [' + xht + ', ' + textStatus + ', ' + ex + ']');
            }

        });
    }
};
