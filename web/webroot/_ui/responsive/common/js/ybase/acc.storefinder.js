// PageClass - This may include some global functionality?
koose_this = {

    _autoload: [
        ['init', $storeFinder.length !== 0],
        ['bindStoreChange', $storeFinder.length !== 0],
        ['bindSearch', $storeFinder.length !== 0],
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
        var data = koose_this.storeData;

        if (data) {
            for (var [index, store] of data['data'].entries()) {
                listitems += koose_this.createListItemHtml(store, index);
            }

            $navigationList.html(listitems);

            // select the first store
            var firstInput = $storeFinderInput[0];
            $(firstInput).click();
        }

        var page = koose_this.storeSearchData.page;
        $paginationFrom.html(page * 10 + 1);

        var to = ((page * 10 + 10) > koose_this.storeData.total) ? koose_this.storeData.total : page * 10 + 10;
        $paginationTo.html(to);
        $paginationAll.html(koose_this.storeData.total);
        $storeFinder.removeClass('show-store');
    },

    bindPagination: function () {
        $(document).on('click', '.js-store-finder-details-back', function (e) {
            e.preventDefault();

            $storeFinder.removeClass('show-store');
        });

        $(document).on('click', '.js-store-finder-pager-prev', function (e) {
            e.preventDefault();
            var page = koose_this.storeSearchData.page;
            koose_this.getStoreData(page - 1);
            checkStatus(page - 1);
        });

        $(document).on('click', '.js-store-finder-pager-next', function (e) {
            e.preventDefault();
            var page = koose_this.storeSearchData.page;
            koose_this.getStoreData(page + 1);
            checkStatus(page + 1);
        });

        function checkStatus (page) {
            if (page === 0) {
                $paginationPrev.attr('disabled', 'disabled');
            } else {
                $paginationPrev.removeAttr('disabled');
            }

            if (page === Math.floor(koose_this.storeData.total / 10)) {
                $paginationNext.attr('disabled', 'disabled');
            } else {
                $paginationNext.removeAttr('disabled');
            }
        }
    },

    bindStoreChange: function () {


        $(document).on('click', '.js-select-store-label', function (e) {
            $storeFinder.addClass('show-store');
        });

        $(document).on('click', '.js-back-to-storelist', function (e) {
            $storeFinder.removeClass('show-store');
        });
    },

    initGoogleMap: function () {
        if ($storeFinderMap.length > 0) {
            ACC.global.addGoogleMapsApi('koose_this.loadGoogleMap');
        }
    },

    loadGoogleMap: function () {
        var storeInformation = koose_this.storeId;

        if ($storeFinderMap.length > 0) {
            $storeFinderMap.attr('id', 'store-finder-map');
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
                koose_this.getInitStoreData(q);
            } else {
                if ($('.js-storefinder-alert').length < 1) {
                    var emptySearchMessage = $('.btn-primary').data('searchEmpty');
                    $storeFinder.hide();
                    $('#storeFinder').before('<div class="js-storefinder-alert alert alert-danger alert-dismissable getAccAlert" ><button class="close closeAccAlert" type="button" data-dismiss="alert" aria-hidden="true">×</button>' + emptySearchMessage + '</div>');
                    $('.closeAccAlert').on('click', function () {
                        $(this).parent('.getAccAlert').remove();
                    });
                }
            }
        });

        $storeFinder.hide();
        $(document).on('click', '#findStoresNearMe', function (e) {
            e.preventDefault();
            koose_this.getInitStoreData(null, koose_this.coords.latitude, koose_this.coords.longitude);
        });
    },

    getStoreData: function (page) {
        koose_this.storeSearchData.page = page;
        var url = `${$storeFinder.data('url')}?${$.param(koose_this.storeSearchData)}`;

        fetch(url)
            .then(response => response.json())
            .then(response => {
                koose_this.storeData = response;
                koose_this.refreshNavigation();
                if (koose_this.storeData.total < 10) {
                    $paginationNext.attr('disabled', 'disabled');
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

        koose_this.storeSearchData = data;
        koose_this.getStoreData(data.page);
        $storeFinder.show();
        $paginationPrev.attr('disabled', 'disabled');
        $paginationNext.removeAttr('disabled');
    },

};
