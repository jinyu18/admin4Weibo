/**
 * Created by felixjin on 16/8/4.
 */

'use strict';

function weiboCtrl($scope, $http){

    $scope.user = {};
    
    $scope.loginWeibo = function () {
        console.log($scope.user);

        $http({
            method: 'POST',
            url: '/action/weibo/login',
            data: $scope.user
        }).success(function(results){
            console.log(results);
        });
    };
    
}
