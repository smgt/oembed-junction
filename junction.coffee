http = require 'http'
url = require 'url'

oembed_services = {
  "vimeo.com": "http://vimeo.com/api/oembed.format"
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
      res.writeHead 404, {'Content-Type': 'application/json'}
      res.end(JSON.stringify {message:'not_found', description: 'No target oembed service found'})
      console.log "ERROR - Didn't find redirect: #{req.url}"
  else
    res.writeHead 400, {'Content-Type': 'application/json'}
    console.log "ERROR - Invalid request"
    res.end(JSON.stringify({message:'invalid_request', description:'"url" parameter is missing'}));

.listen 3000
