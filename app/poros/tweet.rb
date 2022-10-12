class Tweet < ApplicationRecord
  attr_reader :text, :created_at, :edit_history_tweet_ids

  def initialize(data)
    binding.pry
    @text = data[:text]
    @created_at = data[:created_at]
    @edit_history_tweet_ids = data[:edit_history_tweet_ids]
  end 
end