Geocoder.configure(
  # geocoding service (see below for supported options):
  lookup: :google,
  
  # caching (see below for details):
  cache: Redis.new
)
