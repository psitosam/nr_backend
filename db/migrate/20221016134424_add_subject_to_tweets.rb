class AddSubjectToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :subject, :string
  end
end
