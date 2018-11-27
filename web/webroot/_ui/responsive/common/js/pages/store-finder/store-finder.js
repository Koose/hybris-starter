// import submitForm from '../../utils/utils';
import PageClass from '../page';

class StoreFinder extends PageClass {
    // TODO encapsulate store finder js
    constructor () {
        super();

        this.$dom = {
            $storeFinder: $('.js-store-finder'),
            $findNearby: $('#findStoresNearMe'),
            $storeFinderInput: $('.js-store-finder-input'),
            $storeFinderMap: $('.js-store-finder-map'),
            $navigationList: $('.js-store-finder-navigation-list'),
            $paginationFrom: $('.js-store-finder-pager-item-from'),
            $paginationTo: $('.js-store-finder-pager-item-to'),
            $paginationAll: $('.js-store-finder-pager-item-all'),
            $paginationPrev: $('.js-store-finder-pager-prev'),
            $paginationNext: $('.js-store-finder-pager-next')
        };

        this.data = {
            storeData: '',
            storeId: '',
            coords: {},
            storeSearchData: {}
        };

        this._bindEvents();
    }

    _onPageReady () {
        const { $findNearby } = this.$dom;

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                function (position) {
                    this.data.coords = position.coords;
                    $findNearby.removeAttr('disabled');
                },
                function (error) {
                    console.log('An error occurred... The error code and message are: ' + error.code + '/' + error.message);
                }
            );
        }
    }

    _bindEvents () {
        $(document).ready(() => {
            this._onPageReady();
        });

        $(document).on('change', '.js-store-finder-input', (e) => {
            e.preventDefault();

            const storeId = $(event.currentTarget).data('id'); // scope issue of arrow function
            const storeData = this.data.storeData['data'];
            const $ele = $('.js-store-finder-details');

            for (let [key, value] of Object.entries(storeData[storeId])) {
                switch (key) {
                    case 'image':
                        let imgHTML = value !== '' ? `<img src="${value}" alt="" />` : '';
                        $ele.find('.js-store-image').html(imgHTML);
                        break;
                    case 'productcode':
                        $ele.find('.js-store-productcode').val(value);
                        break;
                    case 'openings':
                        if (value !== '') {
                            var $oele = $ele.find(`.js-store-${key}`);
                            var openings = '';

                            for (let [key2, value2] of Object.entries(value)) {
                                openings +=
                                `<dt>${key2}</dt>
                                 <dd>${value2}<dd>`;
                            }

                            $oele.html(openings);
                        } else {
                            $ele.find(`.js-store-${key}`).html('');
                        }
                        break;
                    case 'specialOpenings':

                        break;
                    case 'features':
                        var features = '';

                        for (let value2 of Object.entries(value)) {
                            features += `<li>${value2}</li>`;
                        }

                        $ele.find(`.js-store-${key}`).html(features);
                        break;

                    default:
                        $ele.find(`.js-store-${key}`).html(value);
                }
            }

            this.data.storeId = storeData[storeId];
            this._initGoogleMap();
        });
    }

    _initGoogleMap () {
        const {$storeFinderMap} = this.$dom;

        if ($storeFinderMap.length > 0) {
            if ($('.js-googleMapsApi').length === 0) {
                $('head').append('<script class="js-googleMapsApi" type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=' + ACC.config.googleApiKey + '&sensor=false&callback=' + callback + '"></script>');
            } else {
                this._loadGoogleMap();
            }
        }
    }

    _loadGoogleMap () {
        const storeInformation = this.data.storeId;

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
    }
}

export default StoreFinder;
