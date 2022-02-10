class DiariesController < ApplicationController
  def index
    @diaries = Diary.includes(:user)
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to diaries_path
    else
      render :index
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:start_time, :title, :text, :thought, :mind_id, :category_id, :time_length_id).merge(user_id: current_user.id)
  end
  
end
