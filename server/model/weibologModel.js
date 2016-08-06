/**
 * Created by felixjin on 16/8/6.
 */

'use strict';
var weibolog = {
    weibologId : "",    //id
    useragent : "",  //登录浏览器信息
    createtime : "",  //登陆时间
    query: "SELECT * FROM weibolog WHERE 1=1 ",
    insert: "INSERT INTO weibolog SET ",
    pk: "weibologId"
}

module.exports = weibolog;
