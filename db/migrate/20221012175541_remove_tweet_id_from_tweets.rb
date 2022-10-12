class RemoveTweetIdFromTweets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tweets, :tweet_id, :string
  end
end
