var app = angular.module('docker', []);
app.controller('main', ['$scope', '$http',
  function($scope, $http) {
    $scope.load = function() {
      $http.get('/api/list').then(function(res) {
        $scope.data = res.data
      })
    }
    $scope.hostname = function() {
      return window.location.hostname
    }
    $scope.load()
  }
]);