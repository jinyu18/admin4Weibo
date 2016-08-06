/**
 * Created by felixjin on 16/8/6.
 */

'use strict';

var weibologDao = require('../dao/weibologDao.js');


//查询log
exports.query = function(data, callback){
    weibologDao.query(data, function(err, results){
        if(err){
            callback(true);
            return;
        }
        callback(false, results);
    });
};

//新增log
exports.insert = function(data, callback){
    weibologDao.insert(data, function(err){
        if(err){
            callback(true);
            return;
        }
        callback(false);
    });
};

