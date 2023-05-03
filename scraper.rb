require 'json'
require 'typhoeus'

users = { mensa_scran: '1541741641060519941', footy_scran: '1320495373769723904' }
bearer_token = ENV["TWITTER_BEARER_TOKEN"]

endpoint_url = "https://api.twitter.com/2/users/:id/tweets"