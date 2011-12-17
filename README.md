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

* 5min.com - http://api.5min.com/oembed.json
* bambuser.com - http://api.bambuser.com/oembed.json
* blip.tv - http://blip.tv/oembed/
* collegehumor.com - http://www.collegehumor.com/oembed.json
* dailymotion.com - http://www.dailymotion.com/api/oembed
* flickr.com - http://www.flickr.com/services/oembed/
* funnyordie.com - http://www.funnyordie.com/oembed
* hulu.com - http://www.hulu.com/api/oembed.json
* ifixit.com - http://www.ifixit.com/Embed
* justin.tv - http://api.justin.tv/api/embed/from_url.json
* mixcloud.com - http://www.mixcloud.com/oembed/
* my.opera.com - http://my.opera.com/service/oembed
* official.fm - http://official.fm/services/oembed.json
* photobucket.com - http://photobucket.com/oembed
* polldaddy.com - http://polldaddy.com/oembed/
* polleverywhere.com - http://www.polleverywhere.com/services/oembed/
* qik.com - http://qik.com/api/oembed.json
* revision3.com - http://revision3.com/api/oembed/
* scribd.com - http://www.scribd.com/services/oembed
* slideshare.net - http://www.slideshare.net/api/oembed/2
* smugmug.com - http://api.smugmug.com/services/oembed/
* soundcloud.com - http://soundcloud.com/oembed
* viddler.com - http://lab.viddler.com/services/oembed/
* vimeo.com - http://vimeo.com/api/oembed.json
* wordpress.com - http://public-api.wordpress.com/oembed/
* wordpress.tv - http://wordpress.tv/oembed/
* yfrog.com - http://www.yfrog.com/api/oembed
* youtube.com - http://www.youtube.com/oembed


## WTF is oembed?

[I want to know more about oembed.](http://oembed.com)

## Creator

Copyright 2011 Simon Gate
