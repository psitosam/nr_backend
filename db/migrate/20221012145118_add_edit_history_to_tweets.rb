class AddEditHistoryToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :edit_history_tweet_ids, :text, array: true
  end
end
