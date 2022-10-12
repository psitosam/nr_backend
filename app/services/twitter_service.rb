class TwitterService
  def self.get_recent_tweets(query)
    response = conn.get("/2/tweets/search/recent") do |f|
      f.params[:query] = query
      f.params[:max_results] = 10
      f.params["tweet.fields"] = "created_at"
    end
    JSON.parse(response.body, symbolize_names: true)
  end 

  def self.conn
    Faraday.new("https://api.twitter.com") do |f|
      f.headers['Authorization'] = "Bearer #{ENV['twitter_bearer_token']}"
    end
  end 
  # require 'twitter'
  # @client = Twitter::REST::Client.new do |config|
  #   config.consumer_key = "#{ENV['twitter_api_key']}"
  #   config.consumer_secret = "#{ENV['twitter_api_key_secret']}"
  # end 

  # def self.get_recent_tweets(query)
  #   @client.search("#{query}", result_type: "recent").take(10)
  # end 
end 