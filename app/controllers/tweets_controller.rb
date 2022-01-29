class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @tweets = Tweet.includes(:user).order('created_at DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end



  private

  def tweet_params
    params.require(:tweet).permit(:title, :text, :mind_id, :category_id, :time_zone_id).merge(user_id: current_user.id)
  end
end
