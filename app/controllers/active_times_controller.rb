class ActiveTimesController < ApplicationController

  def new
    @stamp = ActiveTime.new
    @target = current_user.targets.all
  end

  def stamps
    @stamp = ActiveTime.new(active_time_params)
    @stamp.target_id = params[:active_time][:target_id]
  end

  def create
    @stamp = ActiveTime.new(active_time_params)
    @stamp.date = Date.current
    @stamp.start_time = Time.current
    @stamp.end_time = ""
    @stamp.day_total_time = ""
    if @stamp.save
      # binding.pry
      redirect_to request.referer, notice: "打刻を開始しました"
    else
      @stamp = ActiveTime.new
    @target = current_user.targets.all
      render :new
    end
  end

  def index#打刻一覧(日時)


  end

  def show#打刻詳細(編集もできる)

  end

  def update
    @stamp = ActiveTime.where(end_time: nil)
    @stamp.end_time = Time.current
    @stamp.day_total_time

  end

  private

  def active_time_params
    params.require(:active_time).permit(:date,:start_time,:end_time,:day_total_time,:target_id)
  end

end
