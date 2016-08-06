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
    $scope.list = [];

    $scope.$watch("code",function(newValue,oldValue, scope) {
        console.log(newValue);

        if (newValue == null || newValue == '') {
            return;
        }

        $http({
            method: 'POST',
            url: '/action/weibo/get_timeline',
            data: {code: newValue}
        }).success(function(results){
            console.log(results);
            if (results.msg.indexOf('成功') != -1) {

                $scope.list = results.data.statuses;
            }else {
                alert("发生了错误");
            }
        });
    }, true);
    
}
