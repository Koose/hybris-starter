// PageClass - This may include some global functionality?
ACC.storefinder = {

    _autoload: [
        ['init', $('.js-store-finder').length !== 0],
        ['bindStoreChange', $('.js-store-finder').length !== 0],
        ['bindSearch', $('.js-store-finder').length !== 0],
        'bindPagination'
    ],

    storeData: '',
    storeId: '',
    coords: {},
    storeSearchData: {},

    createListItemHtml: function (data, id) {
        var item =
        `<li class="list__entry">
            <input type="radio" name="storeNamePost" value="${data.displayName}" id="store-filder-entry-${id}" class="js-store-finder-input" data-id="${id}">
            <label for="store-filder-entry-${id}" class="js-select-store-label">
                <span class="entry__info">
                    <span class="entry__name">${data.displayName}</span>
                    <span class="entry__address">${data.line1}\u00A0${data.line2}</span>
                    <span class="entry__city">${data.town}</span>
                </span>
                <span class="entry__distance">
                    <span>${data.formattedDistance}</span>
                </span>
            </label>
        </li>`;
        return item;
    },

    refreshNavigation: function () {
        var listitems = '';
        var data = ACC.storefinder.storeData;

        if (data) {
            for (var i = 0; i < data['data'].length; i++) {
                listitems += ACC.storefinder.createListItemHtml(data['data'][i], i);
            }

            $('.js-store-finder-navigation-list').html(listitems);

            // select the first store
            var firstInput = $('.js-store-finder-input')[0];
            $(firstInput).click();
        }

        var page = ACC.storefinder.storeSearchData.page;
        $('.js-store-finder-pager-item-from').html(page * 10 + 1);

        var to = ((page * 10 + 10) > ACC.storefinder.storeData.total) ? ACC.storefinder.storeData.total : page * 10 + 10;
        $('.js-store-finder-pager-item-to').html(to);
        $('.js-store-finder-pager-item-all').html(ACC.storefinder.storeData.total);
        $('.js-store-finder').removeClass('show-store');
    },

    bindPagination: function () {
        $(document).on('click', '.js-store-finder-details-back', function (e) {
            e.preventDefault();

            $('.js-store-finder').removeClass('show-store');
        });

        $(document).on('click', '.js-store-finder-pager-prev', function (e) {
            e.preventDefault();
            var page = ACC.storefinder.storeSearchData.page;
            ACC.storefinder.getStoreData(page - 1);
            checkStatus(page - 1);
        });

        $(document).on('click', '.js-store-finder-pager-next', function (e) {
            e.preventDefault();
            var page = ACC.storefinder.storeSearchData.page;
            ACC.storefinder.getStoreData(page + 1);
            checkStatus(page + 1);
        });

        function checkStatus (page) {
            if (page === 0) {
                $('.js-store-finder-pager-prev').attr('disabled', 'disabled');
            } else {
                $('.js-store-finder-pager-prev').removeAttr('disabled');
            }

            if (page === Math.floor(ACC.storefinder.storeData.total / 10)) {
                $('.js-store-finder-pager-next').attr('disabled', 'disabled');
            } else {
                $('.js-store-finder-pager-next').removeAttr('disabled');
            }
        }
    },

    bindStoreChange: function () {
        $(document).on('change', '.js-store-finder-input', function (e) {
            e.preventDefault();

            var storeData = ACC.storefinder.storeData['data'];

            var storeId = $(this).data('id');

            var $ele = $('.js-store-finder-details');

            $.each(storeData[storeId], function (key, value) {
                if (key === 'image') {
                    if (value !== '') {
                        $ele.find('.js-store-image').html('<img src="' + value + '" alt="" />');
                    } else {
                        $ele.find('.js-store-image').html('');
                    }
                } else if (key === 'productcode') {
                    $ele.find('.js-store-productcode').val(value);
                } else if (key === 'openings') {
                    if (value !== '') {
                        var $oele = $ele.find('.js-store-' + key);
                        var openings = '';
                        $.each(value, function (key2, value2) {
                            openings += '<dt>' + key2 + '</dt>';
                            openings += '<dd>' + value2 + '</dd>';
                        });

                        $oele.html(openings);
                    } else {
                        $ele.find('.js-store-' + key).html('');
                    }
                } else if (key === 'specialOpenings') {} else if (key === 'features') {
                    var features = '';
                    $.each(value, function (key2, value2) {
                        features += '<li>' + value2 + '</li>';
                    });

                    $ele.find('.js-store-' + key).html(features);
                } else {
                    if (value !== '') {
                        $ele.find('.js-store-' + key).html(value);
                    } else {
                        $ele.find('.js-store-' + key).html('');
                    }
                }
            });

            ACC.storefinder.storeId = storeData[storeId];
            ACC.storefinder.initGoogleMap();
        });

        $(document).on('click', '.js-select-store-label', function (e) {
            $('.js-store-finder').addClass('show-store');
        });

        $(document).on('click', '.js-back-to-storelist', function (e) {
            $('.js-store-finder').removeClass('show-store');
        });
    },

    initGoogleMap: function () {
        if ($('.js-store-finder-map').length > 0) {
            ACC.global.addGoogleMapsApi('ACC.storefinder.loadGoogleMap');
        }
    },

    loadGoogleMap: function () {
        var storeInformation = ACC.storefinder.storeId;

        if ($('.js-store-finder-map').length > 0) {
            $('.js-store-finder-map').attr('id', 'store-finder-map');
            var centerPoint = new google.maps.LatLng(storeInformation['latitude'], storeInformation['longitude']);

            var mapOptions = {
                zoom: 13,
                zoomControl: true,
                panControl: true,
                streetViewControl: false,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: centerPoint
            };

            var map = new google.maps.Map(document.getElementById('store-finder-map'), mapOptions);

            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(storeInformation['latitude'], storeInformation['longitude']),
                map: map,
                title: storeInformation['name'],
                icon: 'https://maps.google.com/mapfiles/marker' + 'A' + '.png'
            });
            var infowindow = new google.maps.InfoWindow({
                content: storeInformation['name'],
                disableAutoPan: true
            });
            google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });
        }
    },

    bindSearch: function () {
        $(document).on('submit', '#storeFinderForm', function (e) {
            e.preventDefault();

            var q = $('.js-store-finder-search-input').val();

            if (q.length > 0) {
                ACC.storefinder.getInitStoreData(q);
            } else {
                if ($('.js-storefinder-alert').length < 1) {
                    var emptySearchMessage = $('.btn-primary').data('searchEmpty');
                    $('.js-store-finder').hide();
                    $('#storeFinder').before('<div class="js-storefinder-alert alert alert-danger alert-dismissable getAccAlert" ><button class="close closeAccAlert" type="button" data-dismiss="alert" aria-hidden="true">×</button>' + emptySearchMessage + '</div>');
                    $('.closeAccAlert').on('click', function () {
                        $(this).parent('.getAccAlert').remove();
                    });
                }
            }
        });

        $('.js-store-finder').hide();
        $(document).on('click', '#findStoresNearMe', function (e) {
            e.preventDefault();
            ACC.storefinder.getInitStoreData(null, ACC.storefinder.coords.latitude, ACC.storefinder.coords.longitude);
        });
    },

    getStoreData: function (page) {
        ACC.storefinder.storeSearchData.page = page;
        var url = `${$('.js-store-finder').data('url')}?${$.param(ACC.storefinder.storeSearchData)}`;

        fetch(url)
            .then(response => response.json())
            .then(response => {
                ACC.storefinder.storeData = response;
                ACC.storefinder.refreshNavigation();
                if (ACC.storefinder.storeData.total < 10) {
                    $('.js-store-finder-pager-next').attr('disabled', 'disabled');
                }
            });
    },

    getInitStoreData: function (q, latitude, longitude) {
        $('.alert').remove();
        var data = {
            'q': '',
            'page': 0
        };
        if (q != null) {
            data.q = q;
        }

        if (latitude != null) {
            data.latitude = latitude;
        }

        if (longitude != null) {
            data.longitude = longitude;
        }

        ACC.storefinder.storeSearchData = data;
        ACC.storefinder.getStoreData(data.page);
        $('.js-store-finder').show();
        $('.js-store-finder-pager-prev').attr('disabled', 'disabled');
        $('.js-store-finder-pager-next').removeAttr('disabled');
    },

    init: function () {
        $('#findStoresNearMe').attr('disabled', 'disabled');
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                function (position) {
                    ACC.storefinder.coords = position.coords;
                    $('#findStoresNearMe').removeAttr('disabled');
                },
                function (error) {
                    console.log('An error occurred... The error code and message are: ' + error.code + '/' + error.message);
                }
            );
        }
    }
};
