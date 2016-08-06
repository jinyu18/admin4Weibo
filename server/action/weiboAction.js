/*
 * @Author: jin yu
 * @Date:   2015-06-11 14:33:36
 * @Last Modified by:   jin yu
 * @Last Modified time: 2015-07-06 16:04:56
 */

var express = require('express');
var router = express.Router();


var Weibo = require('nodeweibo');
var weibologService = require('../service/weibologService.js');



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

//查询角色
router.post("/weibo/queryLog", function(req, res){
    var data = req.body;
    weibologService.query(data, function(err, results){
        if(err){
            res.json({msg: '查询失败'});
            return;
        }
        res.json(results);
    });
});

router.post("/weibo/get_timeline", function (req, res) {
    var data = req.body;
    var jsonParas = {
    code: data.code,
    grant_type:"authorization_code"
    };

    Weibo.OAuth2.access_token(jsonParas,function(data){
        console.log(data);
        if (data.error != null) {
            res.json({msg: '失败', data: data});
            return;
        }else {
            new Date().getTime()
            // insert weibo log
            var log = {
                weibologId : new Date().getTime(),
                useragent : req.headers["user-agent"],
                createtime : new Date()
            }
            weibologService.insert(log, function(err){
                if(err){
                    res.json({msg: '新增log失败'});
                    return;
                }
                console.log("新增log成功");
            });

            var para = {
                "source": Weibo.appKey.appKey,
                "access_token": "2.00wJuIMCPqqOdEb6fbdb7ef6AF_BaC"//data.access_token // TODO 应用审核未通过 取token失败,用自己通过测试工具取得的token测试使用 http://open.weibo.com/tools/console?uri=statuses/public_timeline&httpmethod=GET&{{{apiToolPara}}}
            };

            // get public timeline
            Weibo.Statuses.public_timeline(para, function(data){  // user_timeline  pubilc所有用户发的 user 用户自己发布的
                console.log(data);
                if (data.error != null) {
                    res.json({msg: '失败', data: data});
                }else {
                    res.json({msg: '取得成功', data: data});
                }
            });
        }


    });




});


module.exports = router;