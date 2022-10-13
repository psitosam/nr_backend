require 'rails_helper'

RSpec.describe TweetFacade do 
  it 'returns tweets by topic' do 
    response_body = File.read("spec/fixtures/nasa_query.json")
    stub_request(:get, "https://api.twitter.com/2/tweets/search/recent?max_results=10&query=nasa&tweet.fields=created_at").
         to_return(status: 200, body: response_body, headers: {})

    results = TweetFacade.find_by_topic("nasa")

    binding.pry
  end 
end 