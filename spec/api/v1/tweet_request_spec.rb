require 'rails_helper'

RSpec.describe 'tweet request' do 
  it 'successful response returns tweet objects' do 
    response_body = File.read("spec/fixtures/healthcare_query.json")
    stub_request(:get, "https://api.twitter.com/2/tweets/search/recent?max_results=10&query=healthcare&tweet.fields=created_at").
         to_return(status: 200, body: response_body, headers: {})
    
    test = TwitterService.get_recent_tweets("healthcare")
    
    info = test[:data][0]
    Tweet.create!(info)
    
    expect(Tweet.last).to be_a(Tweet)
  end 

end 