
Tweet.destroy_all

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

puts "getting tweets data"

def healthcare_dataset
  tweets = TwitterService.get_recent_tweets("healthcare")
  tweets[:data].each do |t|
    Tweet.create!(
      text: t[:text],
      created_at: t[:created_at],
      edit_history_tweet_ids: t[:edit_history_tweet_ids]
    )
  end 
end 

healthcare_dataset()
puts "Seeding Healthcare Data"

def opensource_dataset
  tweets = TwitterService.get_recent_tweets("opensource")
  tweets[:data].each do |t|
    Tweet.create!(
      text: t[:text],
      created_at: t[:created_at],
      edit_history_tweet_ids: t[:edit_history_tweet_ids]
    )
  end 
end 

opensource_dataset()
puts "Seeding Opensource Data"

def nasa_dataset
  tweets = TwitterService.get_recent_tweets("nasa")
  tweets[:data].each do |t|
    Tweet.create!(
      text: t[:text],
      created_at: t[:created_at],
      edit_history_tweet_ids: t[:edit_history_tweet_ids]
    )
  end 
end 

nasa_dataset()
puts "Seeding Nasa Data"
