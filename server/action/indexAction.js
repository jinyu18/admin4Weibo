/* 
* @Author: 
* @Date:   2015-06-09 12:51:03
* @Last Modified by:   jin yu
* @Last Modified time: 2015-06-17 16:10:31
*/

var express = require('express');
var router = express.Router();

/* GET / page. */
router.get('/', function(req, res, next) {
  if(!req.session.user){
    res.render("login");
    return;
  }
  // 赋值给模版
  res.locals.user = req.session.user;
  var code = req.query['code'];
  res.locals.code = code;
  res.render('index');
});

module.exports = router;