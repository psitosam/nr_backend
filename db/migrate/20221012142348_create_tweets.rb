class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.text :body
      t.datetime :created_at
      t.string :tweet_id

      
    end
  end
end
