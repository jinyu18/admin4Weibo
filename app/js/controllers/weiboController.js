/**
 * Created by felixjin on 16/8/4.
 */

'use strict';

function WeiboCtrl($scope, $http){


    
    $scope.loginWeibo = function () {

        $http({
            method: 'POST',
            url: '/action/weibo/login'
        }).success(function(results){
            console.log(results);
        });
    };

    $scope.code = window.code;

    $scope.$watch("code",function(newValue,oldValue, scope) {
        console.log(newValue);
    }, true);
    
}
