require 'rails_helper'

RSpec.describe Tweet, type: :model do 
  describe 'validations' do 
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:created_at) }
  it { should validate_presence_of(:edit_history_tweet_ids) }
  end 

  it 'exists and has readable attributes' do 
    tweet = Tweet.create!(created_at: "2022-10-12T18:11:18.000Z", text: "NASA Awards Contracts to Assess Near-Space Communications Capabilities https://t.co/NLVzuGsExg #NASA #space", edit_history_tweet_ids: ["1580259830799159296"], lang: "en")

    expect(tweet).to be_a(Tweet)
    expect(tweet.created_at).to eq("2022-10-12T18:11:18.000Z")
    expect(tweet.text).to eq("NASA Awards Contracts to Assess Near-Space Communications Capabilities https://t.co/NLVzuGsExg #NASA #space")
    expect(tweet.edit_history_tweet_ids).to eq(["1580259830799159296"])
    expect(tweet.lang).to eq("en")
  end 
end 