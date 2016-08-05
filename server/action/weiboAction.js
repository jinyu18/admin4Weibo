/*
 * @Author: jin yu
 * @Date:   2015-06-11 14:33:36
 * @Last Modified by:   jin yu
 * @Last Modified time: 2015-07-06 16:04:56
 */

var express = require('express');
var router = express.Router();


var Weibo = require('nodeweibo');



//微博登录操作
router.post("/weibo/login", function(req, res){

    /*
     initialize weibo before using it
     */
    Weibo.init({
        "appKey":"4263807830",
        "appSecret":"f314a703b2586510ae62a8baaef1570e",
        "redirectUrl":"127.0.0.1:3000"
    });

    Weibo.authorize();
    
});


module.exports = router;