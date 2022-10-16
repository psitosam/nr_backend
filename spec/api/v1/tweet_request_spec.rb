require 'rails_helper'

RSpec.describe 'tweet request' do 
  # Consuming external API
  it 'successful Twitter API response returns info to create Tweets' do 
    query = "healthcare"
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
    
    tweets = TwitterService.get_recent_tweets(query)
    # Using the Twitter API mock response to gather correct data
    tweets[:data].each do |t|
      Tweet.create!(
        text: t[:text],
        created_at: t[:created_at],
        edit_history_tweet_ids: t[:edit_history_tweet_ids],
        lang: t[:lang],
        subject: query
      )
    end
    #  Checking to make sure the data matches what is needed to build a Tweet object, and that it is categorized correctly by subject in db.
    expect(Tweet.last).to be_a(Tweet)
    expect(Tweet.last.id).to be_a(Integer)
    expect(Tweet.last.text).to be_a(String)
    expect(Tweet.last.created_at.class).to be(ActiveSupport::TimeWithZone)
    expect(Tweet.last.edit_history_tweet_ids).to be_a(Array)
    expect(Tweet.last.lang).to eq("en")
    expect(Tweet.last.subject).to eq("healthcare")
  end 

  it 'index action with params returns correct tweets in the db' do 
    # Exposing index endpoint for front end to consume:
    create_list(:tweet, 10, subject: "healthcare")
    # Factory bot and Faker gems used here to build test data
    get "/api/v1/tweets", params: {query: "healthcare"}

    parsed = JSON.parse(response.body, symbolize_names:true)
    
    expect(response).to be_successful
    expect(response.status).to eq(200)
    tweets = parsed[:data]
    expect(tweets.class).to eq(Array)
    expect(tweets.length).to eq(10)
    # Testing that the request returns success, and that it is coming back from the database as an Array with each Tweet being an element within the Array, with a total length equal to the number of fake Tweets created above.

    tweets.each do |tweet|
      expect(tweet).to have_key(:attributes)
      expect(tweet[:attributes]).to have_key(:created_at)
      expect(tweet[:attributes][:created_at]).to be_a(String)
      expect(tweet[:attributes]).to have_key(:text)
      expect(tweet[:attributes][:text]).to be_a(String)
      expect(tweet[:attributes]).to have_key(:edit_history_tweet_ids)
      expect(tweet[:attributes][:edit_history_tweet_ids]).to be_a(Array)
      expect(tweet[:attributes][:subject]).to eq("healthcare")
    end
    # Checking for the correct shape and key/value pairs expected, and that they are all categorized as subject: "healthcare" in accordance with query params.
  end 
  
  it 'no query params returns appropriate error message' do 
    get "/api/v1/tweets"

    parsed = JSON.parse(response.body, symbolize_names:true)

    expect(parsed[:data][:message]).to eq("No tweets found with that subject")
  end 
end 