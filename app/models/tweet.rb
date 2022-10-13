class Tweet < ApplicationRecord
  validates_presence_of :text,
                        :created_at,
                        :edit_history_tweet_ids,
                        :lang
end
