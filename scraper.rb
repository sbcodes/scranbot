require 'json'
require 'typhoeus'

users = ['1541741641060519941', '1320495373769723904'] # mensascran, footyscran
bearer_token = ENV["TWITTER_BEARER_TOKEN"]

endpoint_url = "https://api.twitter.com/2/users/:id/tweets"

query_params = {
    "max_results" => 5,
    "expansions" => "attachments.poll_ids,attachments.media_keys,author_id",
    "tweet.fields" => "attachments,author_id,conversation_id,created_at,entities,id,lang",
    "user.fields" => "description"
}

def get_user_tweets(url, bearer_token, query_params)
    options = {
        method: 'get',
        headers: {
        "User-Agent" => "scranbot",
        "Authorization" => "Bearer #{bearer_token}"
        },
    params: query_params
    }
    request = Typhoeus::Request.new(url, options)
    response = request.run
    return response
end

users.each do |id|
    url = endpoint_url.gsub(':id', id)
    p url
    response = get_user_tweets(url, bearer_token, query_params)
    puts response.code, JSON.pretty_generate(JSON.parse(response.body))
end