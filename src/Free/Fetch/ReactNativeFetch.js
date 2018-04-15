'use strict';

var Fetch = require('fetch');

exports.fetch = function fetch(url) {
  return function(onError, onSuccess) {
    var promise = Fetch.fetch(url);

    promise.then(function(response) {
      onSuccess(response);
    }).catch(function(error) {
      onError(error);
    });

    return function () {
    };
  };
};

exports.text = function text(response) {
  return function(onError, onSuccess) {
    var promise = response.text();

    promise.then(function(result) {
      onSuccess(result);
    }).catch(function(error) {
      onError(error);
    });

    return function () {
    };
  };
};

exports.json = function json(response) {
  return function(onError, onSuccess) {
    var promise = response.json();

    promise.then(function(result) {
      onSuccess(result);
    }).catch(function(error) {
      onError(error);
    });

    return function () {
    };
  };
};
