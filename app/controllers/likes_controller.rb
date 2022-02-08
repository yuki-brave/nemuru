class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, tweet_id: params[:tweet_id])
    if @like.save
      redirect_to tweet_path(params[:tweet_id])
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    if @like.destroy
      redirect_to tweet_path(params[:tweet_id])
    end
  end
end
