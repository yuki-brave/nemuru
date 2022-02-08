class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet

  def create
    like = Like.new(user_id: current_user.id, tweet_id: params[:tweet_id])
    like.save
  end

  def destroy
    like = Like.find_by(tweet_id: params[:tweet_id])
    like.destroy
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
