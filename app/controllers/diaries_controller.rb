class DiariesController < ApplicationController
  before_action :set_diary, only: [:show]

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

  def show
    if @diary.mind_id.present?
      @mind = Mind.find(@diary.mind_id)[:name]
    else
      @mind == nil
    end
    if @diary.category_id.present?
      @category = Category.find(@diary.category_id)[:name]
    else
      @category == nil
    end
    if @diary.time_length_id.present?
      @time_length = TimeLength.find(@diary.time_length_id)[:name]
    else
      @time_length == nil
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:start_time, :title, :text, :thought, :mind_id, :category_id, :time_length_id).merge(user_id: current_user.id)
  end
  
  def set_diary
    @diary = Diary.find(params[:id])
  end

end
