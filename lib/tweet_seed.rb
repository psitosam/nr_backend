class TweetSeed 
  def self.seed 
    Tweet.destroy_all 
    puts "Getting tweets data"
    query_array = ["healthcare", "opensource", "nasa"]
    query_array.each do |query|
      puts "Seeding #{query} data"
      tweets = TwitterService.get_recent_tweets(query)
      tweets[:data].each do |t|
        Tweet.create!(
          text: t[:text],
          created_at: t[:created_at],
          edit_history_tweet_ids: t[:edit_history_tweet_ids]
        )
      end
    end 
  end
end

TweetSeed.seed()