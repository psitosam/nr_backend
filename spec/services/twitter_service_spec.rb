require 'rails_helper'

RSpec.describe "Twitter service" do 
  it "retrieves 10 tweets for a given query" do 
    response_body = File.read("spec/fixtures/healthcare_query.json")
    stub_request(:get, "https://api.twitter.com/2/tweets/search/recent?max_results=10&query=healthcare&tweet.fields=created_at").
         to_return(status: 200, body: response_body, headers: {})
    test = TwitterService.get_recent_tweets("healthcare")
    
    expect(test[:meta][:result_count]).to eq(10)
  end   

  it "seeds database with tweets from Twitter API" do
    response_body = File.read("spec/fixtures/healthcare_query.json")
    stub_request(:get, "https://api.twitter.com/2/tweets/search/recent?max_results=10&query=healthcare&tweet.fields=created_at").
         to_return(status: 200, body: response_body, headers: {})
    test = TwitterService.get_recent_tweets("healthcare")
    dataset =
    test[:data].each do |t|
      Tweet.create!(
        text: t[:text],
        created_at: t[:created_at],
        edit_history_tweet_ids: t[:edit_history_tweet_ids]
      )
    end 
  end
end 