class Api::V1::TweetsController < ApplicationController
  
  def new
  end 

  def index
    render json: TweetSerializer.multiple_tweets(Tweet.all)
  end 

  def show
    if Tweet.exists?(params[:id])
      render json: TweetSerializer.single_tweet(Tweet.find(params[:id]))
    else
      return not_found
    end
  end 
  
  
  private 
    def tweet_params
      params.permit(:created_at, :text, :edit_history_tweet_ids)
    end

    def not_found 
      render json: { data: {message: 'No tweet matches this id'} },
      status: 404
    end
end 