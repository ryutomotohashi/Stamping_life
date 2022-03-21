class TimeStampsController < ApplicationController

  def new
    @stamp = TimeStamp.new
    @targets = current_user.targets.all
  end

  def create
    @stamp = TimeStamp.new(time_stamps_params)
    @stamp.target_id = params[:time_stamp][:target_id]
    @stamp.user_id = current_user.id
    @stamp.date = Date.current
    @stamp.start_time = Time.current
    if @stamp.save
      flash[:notice] = "打刻を開始します"
      redirect_to stamps_path(@stamp)
    else
      @targets = current_user.targets.all
      render :new
    end

  end

  def stamps
    @stamp = TimeStamp.find(params[:id])
  end

  def endstamp
    @stamp = TimeStamp.where(end_time: nil)
    @stamp.update(end_time: Time.current)
    flash[:notice] = "打刻を終了しました"
    redirect_to request.referer
  end

  def index#打刻一覧(日時)


  end

  def show#打刻詳細(編集もできる)

  end

  def update

    # binding.pry
  end

  private

  def time_stamps_params
    params.require(:time_stamp).permit(:target_id, :date, :start_time, :end_time)
  end
end
