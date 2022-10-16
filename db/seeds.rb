
Tweet.destroy_all

puts "Getting tweets data"


def tweet_dataset
  query_array = ["healthcare", "opensource", "nasa"]
  query_array.each do |query|
    puts "Seeding #{query} data"
    tweets = TwitterService.get_recent_tweets(query)
    tweets[:data].each do |t|
      Tweet.create!(
        text: t[:text],
        created_at: t[:created_at],
        edit_history_tweet_ids: t[:edit_history_tweet_ids],
        lang: t[:lang],
        subject: query
      )
    end 
  end
end 

tweet_dataset()