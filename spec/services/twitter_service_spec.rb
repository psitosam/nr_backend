require 'rails_helper'

RSpec.describe "Twitter service" do 
  it "retrieves 10 tweets for a given query" do 
    response_body = File.read("spec/fixtures/healthcare_query.json")
    stub_request(:get, "https://api.twitter.com/2/tweets/search/recent?max_results=10&query=healthcare%20lang:en&tweet.fields=created_at,lang").
    with(
      headers: {
    'Accept'=>'*/*',
    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    'Authorization'=>"Bearer #{ENV['twitter_bearer_token']}",
    'User-Agent'=>'Faraday v2.6.0'
      }).
    to_return(status: 200, body: response_body, headers: {})
    
    test = TwitterService.get_recent_tweets("healthcare")
    
    expect(test[:meta][:result_count]).to eq(10)
  end   
end 