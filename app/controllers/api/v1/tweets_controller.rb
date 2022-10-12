class Api::V1::TweetsController < ApplicationController

  def index
    render json: TweetSerializer.multiple_tweets(Tweet.all)
  end 

  def new
  end 
  
  def create 
    tweet = Tweet.create!(tweet_params)
    if tweet.save
      render json: TweetSerializer.single_tweet(tweet)
    else 
      return invalid_request
    end 
  end 


  private 
    def tweet_params
      params.permit(:created_at, :text, :edit_history_tweet_ids)
    end

    def invalid_request
      render json: { data: { message: 'Invalid request' } }, status: 404
    end
end 