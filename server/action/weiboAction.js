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
    res.redirect("/");

});

router.post("/weibo/get_timeline", function (req, res) {
    var data = req.body;
    var jsonParas = {
    code: data.code,
    grant_type:"authorization_code"
    };

    Weibo.OAuth2.access_token(jsonParas,function(data){
        console.log(data);

        var para = {
            "source": Weibo.appKey.appKey,
            "access_token": "2.00wJuIMCPqqOdEb6fbdb7ef6AF_BaC"//data.access_token // TODO 应用审核未通过 取token失败,用自己token暂时代替 http://open.weibo.com/tools/console?uri=statuses/public_timeline&httpmethod=GET&{{{apiToolPara}}}
        };

        // get public timeline
        Weibo.Statuses.public_timeline(para, function(data){
            console.log(data);
            res.json({msg: '取得成功', data: data});
        });
    });




});


module.exports = router;