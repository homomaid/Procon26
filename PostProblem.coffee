request = require 'request'

host = 'testform26.procon-online.net'
token = '0123456789abcdef'

###
問題を取得する部分、仕様には含まれてない
getProblem = (url) =>
    request.get url, (error, response, body) =>
        console.log if !error && response.statusCode == 200 then \
        body else 'error : ' + response.statusCode
###

postProblem = (file) =>
    option =
        url : 'http://' + host + '/answer'
        form :
            token : token
            answer : file

    request.post option, (erroe, response, body) =>
        console.log if !error && response.statusCode == 200 then \
        body else 'error : ' + response.statusCode
