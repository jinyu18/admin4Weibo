/* 
* @Author: 
* @Date:   2015-07-03 13:52:41
* @Last Modified by:   jin yu
* @Last Modified time: 2015-07-06 11:09:58
*/

'use strict';

var db = require('../database.js');
var roleModel = require('../model/weibologModel.js');
var req2Sql = require('../util/req2Sql.js');



//查询log
exports.query = function(data, callback) {
    var sql = roleModel.query;
    req2Sql.getReqSqlByQeury(data, function(reqSql){
        sql += reqSql;
        console.log("查询log: " + sql);
        // get a connection from the pool
        db.mysqlPool.getConnection(function(err, connection) {
            if (err) {
                callback(true);
                connection.release();
                return;
            }
            // make the query
            connection.query(sql, function(err, results) {
                if (err) {
                    callback(true);
                    return;
                }
                callback(false, results);
                connection.release();
            });
        });
    });
};

//新增log
exports.insert = function(data, callback) {
    var sql = roleModel.insert;
    req2Sql.getReqSqlByInsert(data, function(reqSql){
        sql += reqSql;
        console.log("新增log: " + sql);
        // get a connection from the pool
        db.mysqlPool.getConnection(function(err, connection) {
            if (err) {
                callback(true);
                connection.release();
                return;
            }
            // make the query
            connection.query(sql, function(err) {
                if (err) {
                    callback(true);
                    return;
                }
                callback(false);
                connection.release();
            });
        });
    });
};
