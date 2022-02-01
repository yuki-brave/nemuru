class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @tweet_tags = Tweet.includes(:user).order('created_at DESC')
  end

  def new
    @tweet_tag = TweetTag.new
  end

  def create
    @tweet_tag = TweetTag.new(tweet_tag_params)
    if @tweet_tag.valid? 
      @tweet_tag.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  def edit
    tweet_attributes = @tweet.attributes
    @tweet_tag = TweetTag.new(tweet_attributes)
  end

  def update
    @tweet_tag = TweetTag.new(tweet_tag_params)
    if @tweet_tag.valid?
      @tweet_tag.update(tweet_tag_params, @tweet)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to action: :index
  end

  private

  def tweet_tag_params
    params.require(:tweet_tag).permit(:title, :text, :mind_id, :category_id, :time_zone_id, :tag_name).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if current_user.id != @tweet.user_id
  end
end
