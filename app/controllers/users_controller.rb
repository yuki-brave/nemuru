class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @favorite_tweets = @user.favorites
    @diaries = @user.diaries
    @diary = @user.diaries
  end
end
