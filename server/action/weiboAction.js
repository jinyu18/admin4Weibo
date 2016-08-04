/*
 * @Author: jin yu
 * @Date:   2015-06-11 14:33:36
 * @Last Modified by:   jin yu
 * @Last Modified time: 2015-07-06 16:04:56
 */

var express = require('express');
var userService = require('../service/userService.js');
var router = express.Router();

//微博登录操作
router.post("/weibo/login", function(req, res){
    var data = req.body;
    console.log(data);
    // userService.query(data, function(err, results){
    //     if(err || results.length == 0){
    //         res.redirect("/login.html");
    //         return;
    //     }
    //     req.session.user = results[0];
    //     res.redirect("/");
    // });
});


module.exports = router;