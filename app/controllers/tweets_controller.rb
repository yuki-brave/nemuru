class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @tweet = Tweet.includes(:user).order('created_at DESC')
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
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user).order('created_at DESC')
  end

  def edit
    tweet_attributes = @tweet.attributes
    @tweet_tag = TweetTag.new(tweet_attributes)
    @tweet_tag.tag_name = @tweet.tags&.first&.tag_name
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

  def search
    if params[:q]&.dig(:title)
      squished_keywords = params[:q][:title].squish
      params[:q][:title_cont_any] = squished_keywords.split(' ')
    end
    @q = Tweet.ransack(params[:q])
    @tweets = @q.result
  end

  def incre_search
    return nil if params[:keyword] == ''

    tag = Tag.where(['tag_name LIKE (?)', "%#{params[:keyword]}%"])
    render json: { keyword: tag }
  end

  private

  def tweet_tag_params
    params.require(:tweet_tag).permit(:title, :text, :thoughts, :mind_id, :category_id, :time_zone_id,
                                      :tag_name).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if current_user.id != @tweet.user_id
  end
end
