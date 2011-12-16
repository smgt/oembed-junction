# Oembed Junction

This is a [node.js](http://nodejs.org) test application. The idea is to have one oembed
endpoint and then you will get redirected to the correct oembed service.

Example:

```shell
curl -i http://oembed-junction.herokuapp.com/?url=http://vimeo.com/23336972

HTTP/1.1 302 Moved Temporarily
Content-Type: application/json
Location:
http://vimeo.com/api/oembed.json/?url=http://vimeo.com/23336972
Content-Length: 135
Connection: keep-alive

{"message":"found","description":"Found a oembed service","location":"http://vimeo.com/api/oembed.json/?url=http://vimeo.com/23336972"}
```

## Services

Current services oembed-junction supports:

* vimeo.com - http://vimeo.com/api/oembed.json
* youtube.com - http://www.youtube.com/oembed
* flickr.com - http://www.flickr.com/services/oembed/
* qik.com - http://qik.com/api/oembed.json
* revision3.com - http://revision3.com/api/oembed/
* www.hulu.com - http://www.hulu.com/api/oembed.json
* www.collegehumor.com - http://www.collegehumor.com/oembed.json
* www.ifixit.com - http://www.ifixit.com/Embed
* www.smugmug.com - http://api.smugmug.com/services/oembed/
* www.slideshare.net - http://www.slideshare.net/api/oembed/2
* wordpress.com - http://public-api.wordpress.com/oembed/
* justin.tv - http://api.justin.tv/api/embed/from_url.json


## WTF is oembed?

[I want to know more about oembed.](http://oembed.com)

## Creator

Copyright 2011 Simon Gate