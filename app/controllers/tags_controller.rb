class TagsController < ApplicationController
  def index
    @tags = TweetTagRelation.where(tag_id: params[:id])
    @tag_name = Tag.find(params[:id]).tag_name
  end
end
