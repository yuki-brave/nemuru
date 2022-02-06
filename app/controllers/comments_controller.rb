class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @tweet = Tweet.find(params[:tweet_id])
    CommentChannel.broadcast_to @tweet, { comment: @comment, user: @comment.user } if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
