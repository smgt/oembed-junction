http = require 'http'
url = require 'url'

oembed_services = {
  "vimeo.com": "http://vimeo.com/api/oembed.json",
  "youtube.com": "http://www.youtube.com/oembed",
  "flickr.com": 'http://www.flickr.com/services/oembed/',
  "qik.com": 'http://qik.com/api/oembed.json',
  "revision3.com": 'http://revision3.com/api/oembed/',
  "www.hulu.com": 'http://www.hulu.com/api/oembed.json',
  "www.collegehumor.com": 'http://www.collegehumor.com/oembed.json',
  "www.ifixit.com": 'http://www.ifixit.com/Embed',
  "www.smugmug.com": 'http://api.smugmug.com/services/oembed/',
  "www.slideshare.net": 'http://www.slideshare.net/api/oembed/2',
  "wordpress.com": 'http://public-api.wordpress.com/oembed/'
}

port = process.env.PORT || 3000

http.createServer (req, res) ->

  request_url = url.parse req.url, true

  if request_url.query.url

    target = url.parse request_url.query.url

    redirect = oembed_services[target.host]

    if redirect != undefined
      res.writeHead 302, {'Content-Type': 'application/json', 'Location': "#{redirect}/#{request_url.search}"}
      res.end(JSON.stringify({message: 'found', description: 'Found a oembed service', location: "#{redirect}/#{request_url.search}"}))
      console.log "Found redirect: #{redirect}/#{request_url.search}"
    else
      # Use embed.ly as backup
      res.writeHead 302, {'Content-Type': 'application/json', 'Location': "http://api.embed.ly/1/oembed#{request_url.search}"}
      res.end(JSON.stringify({message: 'found', description: 'Using backup service', location: "http://api.embed.ly/1/oembed#{request_url.search}"}))
      console.log "Using embed.ly: #{request_url.search}"
  else
    res.writeHead 400, {'Content-Type': 'application/json'}
    console.log "ERROR - Invalid request"
    res.end(JSON.stringify({message:'invalid_request', description:'"url" parameter is missing'}));

.listen port
