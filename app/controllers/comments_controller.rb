class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @tweet = Tweet.find(params[:tweet_id])
    if @comment.save
      CommentChannel.broadcast_to @tweet, { comment: @comment, user: @comment.user }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id:current_user.id, tweet_id: params[:tweet_id])
  end
end
