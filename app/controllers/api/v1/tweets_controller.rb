class Api::V1::TweetsController < ApplicationController
  
  def new
  end 

  def index
    if params[:query]
      response = TweetFacade.find_by_topic(params[:query])
      render json: TweetSerializer.live_tweets(response)
    else
      render json: TweetSerializer.database_tweets(Tweet.all)
    end
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
      params.permit(:created_at, :text, :edit_history_tweet_ids, :query)
    end

    def not_found 
      render json: { data: {message: 'No tweet matches this id'} },
      status: 404
    end
end 