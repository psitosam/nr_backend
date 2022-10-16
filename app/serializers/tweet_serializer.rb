class TweetSerializer

  def self.database_tweets(tweets)
    {
      data: tweets.map do |tweet|
        self.format_single_database_tweet(tweet)
      end
    }
  end 

  # def self.live_tweets(response)
  #   tweets = response[:data]
  #   {
  #     data: tweets.map do |tweet|
  #       self.format_single_live_tweet(tweet)
  #     end
  #   }
  # end

  def self.single_tweet(tweet)
    {
      data: self.format_single_database_tweet(tweet)
    }
  end 

  # def self.format_single_live_tweet(tweet)
  #   {
  #     id: tweet[:id],
  #     attributes: {
  #       created_at: tweet[:created_at],
  #       text: tweet[:text],
  #       edit_history_tweet_ids: tweet[:edit_history_tweet_ids]
  #     }
  #   }
  # end

  def self.format_single_database_tweet(tweet)
    {
      id: tweet.id,
      attributes: {
        created_at: tweet.created_at,
        text: tweet.text,
        edit_history_tweet_ids: tweet.edit_history_tweet_ids,
        subject: tweet.subject
      }
    }
  end 
end
# Note: with the refactor, we are no longer concerned with serializing live tweets from the Twitter API. Instead, we are periodically querying the Twitter database using the rake db:seed command that is also located in a Cron Job in the Heroku app. That data is stored in the db, and serialized with the Index action according to the query params.