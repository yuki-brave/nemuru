class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet

  def create
    like = Like.new(user_id: current_user.id, tweet_id: params[:tweet_id])
    like.save
    @tweet = Tweet.find(params[:tweet_id])
    @likes_count = Like.where(tweet_id: @tweet.id).count
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    like.destroy
    @tweet = Tweet.find(params[:tweet_id])
    @likes_count = Like.where(tweet_id: @tweet.id).count
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
