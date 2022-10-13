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
end 