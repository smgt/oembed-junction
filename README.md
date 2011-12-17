# Oembed Junction

This is a [node.js](http://nodejs.org) test application. The idea is to have one oembed
end point and then you will get redirected to the correct oembed service.

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

* bambuser.com - http://api.bambuser.com/oembed.json
* collegehumor.com - http://www.collegehumor.com/oembed.json
* flickr.com - http://www.flickr.com/services/oembed/
* hulu.com - http://www.hulu.com/api/oembed.json
* ifixit.com - http://www.ifixit.com/Embed
* justin.tv - http://api.justin.tv/api/embed/from_url.json
* qik.com - http://qik.com/api/oembed.json
* revision3.com - http://revision3.com/api/oembed/
* slideshare.net - http://www.slideshare.net/api/oembed/2
* smugmug.com - http://api.smugmug.com/services/oembed/
* soundcloud.com - http://soundcloud.com/oembed
* viddler.com - http://lab.viddler.com/services/oembed/
* vimeo.com - http://vimeo.com/api/oembed.json
* wordpress.com - http://public-api.wordpress.com/oembed/
* yfrog.com - http://www.yfrog.com/api/oembed
* youtube.com - http://www.youtube.com/oembed


## WTF is oembed?

[I want to know more about oembed.](http://oembed.com)

## Creator

Copyright 2011 Simon Gate
