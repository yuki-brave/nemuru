class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :set_beginning_of_week

  def index
    @diaries = Diary.includes(:user)
    @diary_count = Diary.select(:id).count + Tweet.select(:id).count
    @positive_count = Diary.where(mind_id: 1).count + Tweet.where(mind_id: 1).count
    @negative_count = Diary.where(mind_id: 2).count + Tweet.where(mind_id: 2).count
    @nightmare_count = Diary.where(category_id: 10).count + Tweet.where(category_id: 10).count
    @lucid_dreaming_count = Diary.where(Category_id: 11).count + Tweet.where(category_id: 11).count
    @sleep_paralysis_count = Diary.where(Category_id: 12).count + Tweet.where(category_id: 12).count
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to diaries_path
    else
      render :new
    end
  end

  def show
    if @diary.mind_id.present?
      @mind = Mind.find(@diary.mind_id)[:name]
    else
      @mind.nil?
    end
    if @diary.category_id.present?
      @category = Category.find(@diary.category_id)[:name]
    else
      @category.nil?
    end
    if @diary.time_length_id.present?
      @time_length = TimeLength.find(@diary.time_length_id)[:name]
    else
      @time_length.nil?
    end
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to diary_path(@diary.id)
    else
      render :edit
    end
  end

  def destroy
    if @diary.destroy
      redirect_to diaries_path
    else
      render :show
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:start_time, :title, :text, :thoughts, :mind_id, :category_id,
                                  :time_length_id).merge(user_id: current_user.id)
  end

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end
