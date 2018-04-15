'use strict';

exports.unsafeGet = function unsafeGet(key) {
  return function (response) {
    return response[key];
  };
};
