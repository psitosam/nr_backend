require 'rails_helper'

RSpec.describe Tweet, type: :model do 
  describe 'validations' do 
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:created_at) }
  it { should validate_presence_of(:tweet_id) }
  it { should validate_presence_of(:edit_history_tweet_ids) }
  end 

  it 'exists and has readable attributes' do 
    tweet = Tweet.new(body: "lorem ipsum", created_at: "2022-10-11T23:21:21.000Z", tweet_id: "1579975472817254400")

    expect(tweet).to be_a(Tweet)
    expect(tweet.body).to eq("lorem ipsum")
    expect(tweet.created_at).to eq("2022-10-11T23:21:21.000Z")
    expect(tweet.tweet_id).to eq("1579975472817254400")
  end 
end 