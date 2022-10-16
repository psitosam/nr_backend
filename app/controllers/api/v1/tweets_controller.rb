class Api::V1::TweetsController < ApplicationController
  
  def new
  end 

  def index
    if params[:query]
      render json: TweetSerializer.database_tweets(Tweet.where(subject: params[:query]))
    else
      return not_found 
    end
  end 

    
  private 
    def tweet_params
      params.permit(:created_at, :text, :edit_history_tweet_ids, :query, :subject)
    end

    def not_found 
      render json: { data: {message: 'No tweets found with that subject'} },
      status: 404
    end
end 