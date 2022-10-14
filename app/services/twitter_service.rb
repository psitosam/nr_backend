class TwitterService
  def self.get_recent_tweets(query)
    response = conn.get("/2/tweets/search/recent?query=#{query}%20lang%3Aen&max_results=10&tweet.fields=created_at,lang")
    # response = conn.get("/2/tweets/search/recent") do |f|
    #   f.params[:query] = "#{query}%20lang%3Aen"
    #   f.params[:max_results] = 10
    #   f.params["tweet.fields"] = "created_at,lang"
    # end
    JSON.parse(response.body, symbolize_names: true)
  end 

  def self.conn
    Faraday.new("https://api.twitter.com") do |f|
      f.headers['Authorization'] = "Bearer #{ENV['twitter_bearer_token']}"
    end
  end 
end 