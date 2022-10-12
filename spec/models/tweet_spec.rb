require 'rails_helper'

RSpec.describe Tweet, type: :model do 
  describe 'validations' do 
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:created_at) }
  it { should validate_presence_of(:tweet_id) }
  it { should validate_presence_of(:edit_history_tweet_ids) }
  end 
end 