/**
 * Created by varunok on 15.02.17.
 */
'use strict';

var parsingApp = angular.module('parsingApp', ['ngSanitize']);

angular.module('parsingApp')
    .config(function($httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
});

parsingApp.controller("ParsingController", function($scope, $location, $http) {
    $http.get('get-setting-json')
        .then(function(response) {
            $scope.config = response.data[0].fields;
        })
        .catch(function(data, status) {

        })
        .finally(function() {

        });
    $scope.save = function () {
        $http.post('save-parser-config', angular.toJson($scope.config))
        .then(function(response) {
            jQuery('.messageServer').css('backgroundColor', '#5bc0de');
            jQuery('.messageServer').text('Сохранено').fadeIn(1000).delay(2000).fadeOut(500);
        })
        .catch(function(data, status) {
            jQuery('.messageServer').css('backgroundColor', '#c9302c');
            jQuery('.messageServer').text('Ошибка').fadeIn(1000).delay(2000).fadeOut(500);
        })
    };
});