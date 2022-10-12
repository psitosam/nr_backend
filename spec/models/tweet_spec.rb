require 'rails_helper'

RSpec.describe Tweet, type: :model do 
  describe 'validations' do 
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:created_at) }
  it { should validate_presence_of(:edit_history_tweet_ids) }
  end 

  it 'exists and has readable attributes' do 
    tweet = Tweet.new(text: "lorem ipsum", created_at: "2022-10-11T23:21:21.000Z")

    expect(tweet).to be_a(Tweet)
    expect(tweet.text).to eq("lorem ipsum")
    expect(tweet.created_at).to eq("2022-10-11T23:21:21.000Z")
  end 
end 