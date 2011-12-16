# Oembed Junction

This is a node.js test application. The idea is to have one oembed
endpoint and then you will get redirected to the correct oembed service.

Example:
```shell
curl -i http://oembed-junction.herokuapp.com/\?url=http://vimeo.com/23336972

HTTP/1.1 302 Moved Temporarily
Content-Type: application/json
Location:
http://vimeo.com/api/oembed.json/?url=http://vimeo.com/23336972
Content-Length: 135
Connection: keep-alive

{"message":"found","description":"Found a oembed service","location":"http://vimeo.com/api/oembed.json/?url=http://vimeo.com/23336972"}
```

Copyright 2011 Simon Gate
