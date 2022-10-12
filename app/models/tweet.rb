class Tweet < ApplicationRecord
  validates_presence_of :body,
                        :created_at,
                        :tweet_id,
                        :edit_history_tweet_ids
end
