class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(tweet_id: params[:tweet_id])
    if @like.save
      flash[:success] = "「いいね！」しました"
      redirect_to tweet_path(params[:tweet_id])
    end
  end
end
