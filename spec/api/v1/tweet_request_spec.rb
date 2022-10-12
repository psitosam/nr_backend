require 'rails_helper'

RSpec.describe 'tweet request' do 
  it 'successful response returns info to create Tweets' do 
    response_body = File.read("spec/fixtures/healthcare_query.json")
    stub_request(:get, "https://api.twitter.com/2/tweets/search/recent?max_results=10&query=healthcare&tweet.fields=created_at").
         to_return(status: 200, body: response_body, headers: {})
    
    test = TwitterService.get_recent_tweets("healthcare")
    # Using the Twitter API mock response to gather correct data
    info = test[:data][0]
    Tweet.create!(info)
    
    expect(Tweet.last).to be_a(Tweet)
  end 

  it 'index action returns all tweets in the db' do 
    create_list(:tweet, 30)
    # Factory bot and Faker gems used here to build test data
    get "/api/v1/tweets"
    
    parsed = JSON.parse(response.body, symbolize_names:true)
    
    expect(response).to be_successful
    expect(response.status).to eq(200)
    tweets = parsed[:data]
    expect(tweets.class).to eq(Array)
    expect(tweets.length).to eq(30)
    # Testing that the request returns success, and that it is coming back as an Array with each Tweet being an element within the Array, with a total length equal to the number of fake Tweets created above.

    tweets.each do |tweet|
      expect(tweet).to have_key(:attributes)
      expect(tweet[:attributes]).to have_key(:created_at)
      expect(tweet[:attributes][:created_at]).to be_a(String)
      expect(tweet[:attributes]).to have_key(:text)
      expect(tweet[:attributes][:text]).to be_a(String)
      expect(tweet[:attributes]).to have_key(:edit_history_tweet_ids)
      expect(tweet[:attributes][:edit_history_tweet_ids]).to eq(tweet[:id])
    end
    # Checking for the correct shape and key/value pairs expected.
  end 

end 