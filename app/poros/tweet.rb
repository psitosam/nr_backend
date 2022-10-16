class Tweet < ApplicationRecord
  attr_reader :id, :text, :created_at, :edit_history_tweet_ids, :lang, :subject

  def initialize(data)
    @text = data[:text]
    @created_at = data[:created_at]
    @edit_history_tweet_ids = data[:edit_history_tweet_ids]
    @lang = data[:lang]
    @subject = data[:subject]
  end 
end