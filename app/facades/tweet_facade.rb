class TweetFacade

  def self.find_by_topic(topic)
    TwitterService.get_recent_tweets(topic)
  end
end