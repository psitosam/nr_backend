class TweetSerializer

  def self.multiple_tweets(tweets)
    {
      data: tweets.map do |tweet|
        self.format_single_tweet(tweet)
      end
    }
  end 

  def self.single_tweet(tweet)
    {
      data: self.format_single_tweet(tweet)
    }
  end 

  def self.format_single_tweet(tweet)
    {
      id: tweet.id,
      attributes: {
        created_at: tweet.created_at,
        text: tweet.text,
        edit_history_tweet_ids: tweet.id
      }
    }
  end 
end