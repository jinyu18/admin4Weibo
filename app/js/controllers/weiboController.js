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

        $scope.renderWeiboHome(newValue);

    }, true);

    $scope.renderWeiboHome = function(newValue) {
        $http({
            method: 'POST',
            url: '/action/weibo/auth',
            data: {code: newValue}
        }).success(function(results){
            console.log(results);
            if (results.msg!= null && results.msg.indexOf('成功') != -1) {

                $http({
                    method: 'POST',
                    url: '/action/weibo/get_timeline'
                }).success(function(results){
                    console.log(results);
                    if (results.msg!= null && results.msg.indexOf('成功') != -1) {

                        $scope.list = results.data.statuses;
                    }else {
                        var error = results.data.error_description == null ? "" : "  : "+results.data.error_description;
                        alert("Notice" + error);
                    }
                });

            }else {
                var error = results.data.error_description == null ? "" : "  d: "+results.data.error_description;
                alert("Notice" + error);
            }
        });
    };

    
}
