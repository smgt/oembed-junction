http = require 'http'
url = require 'url'

# Set the http to port 3000 as default
# If you want to change set the shell variable PORT to desired port
port = process.env.PORT || 3000

# List of oembed services and their end points
oembed_services = {
     '5min.com':           'http://api.5min.com/oembed.json',
     'bambuser.com':       'http://api.bambuser.com/oembed.json',
     'blip.tv':            'http://blip.tv/oembed/',
     'collegehumor.com':   'http://www.collegehumor.com/oembed.json',
     'dailymotion.com':    'http://www.dailymotion.com/api/oembed',
     'flickr.com':         'http://www.flickr.com/services/oembed/',
     'funnyordie.com':     'http://www.funnyordie.com/oembed',
     'hulu.com':           'http://www.hulu.com/api/oembed.json',
     'ifixit.com':         'http://www.ifixit.com/Embed',
     'justin.tv':          'http://api.justin.tv/api/embed/from_url.json',
     'mixcloud.com':       'http://www.mixcloud.com/oembed/',
     'my.opera.com':       'http://my.opera.com/service/oembed',
     'official.fm':        'http://official.fm/services/oembed.json',
     'photobucket.com':    'http://photobucket.com/oembed',
     'polldaddy.com':      'http://polldaddy.com/oembed/',
     'polleverywhere.com': 'http://www.polleverywhere.com/services/oembed/',
     'qik.com':            'http://qik.com/api/oembed.json',
     'revision3.com':      'http://revision3.com/api/oembed/',
     'scribd.com':         'http://www.scribd.com/services/oembed',
     'slideshare.net':     'http://www.slideshare.net/api/oembed/2',
     'smugmug.com':        'http://api.smugmug.com/services/oembed/',
     'soundcloud.com':     'http://soundcloud.com/oembed',
     'ustream.tv':         'http://www.ustream.tv/oembed',
     'viddler.com':        'http://lab.viddler.com/services/oembed/',
     'vimeo.com':          'http://vimeo.com/api/oembed.json',
     'wordpress.com':      'http://public-api.wordpress.com/oembed/',
     'wordpress.tv':       'http://wordpress.tv/oembed/',
     'yfrog.com':          'http://www.yfrog.com/api/oembed',
     'youtube.com':        'http://www.youtube.com/oembed'
}


http.createServer (req, res) ->

  # Parse the request URL and the query string
  request_url = url.parse req.url, true

  if request_url.query.url

    # Parse the url parameter URL ;)
    target = url.parse request_url.query.url

    # See if we can find a oembed service
    redirect = oembed_services[target.host]

    # If we didn't find a oembed service try it again and skip the first 4
    # chars. This will probably be the 'www.' part.
    if redirect == undefined
      redirect = oembed_services[target.host.slice(4)]

    # If we found a service redirect to that service
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
    # The url parameter was missing from the query string
    res.writeHead 400, {'Content-Type': 'application/json'}
    console.log "ERROR - Invalid request"
    res.end(JSON.stringify({message:'invalid_request', description:'"url" parameter is missing. More information at http://github.com/simon/oembed-junction'}));

.listen port
