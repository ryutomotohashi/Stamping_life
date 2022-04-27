class TimeStampsController < ApplicationController

  def time_stamps
    @stamp = TimeStamp.find_by(end_time: nil, user_id: current_user.id)
    @date = Date.current
  end

  def start_stamp
    start_time = TimeStamp.new(date: Date.current, start_time: Time.current, end_time: nil, user_id: current_user.id)
    if start_time.save
      redirect_to time_stamps_path, notice: "打刻を開始しました"
    else
      render :time_stamps
    end
  end

  def end_stamp
    stamp = TimeStamp.find(params[:id])
    stamp.update(end_time: Time.current)# binding.pry
    redirect_to time_stamps_path, notice: "打刻を終了しました"
  end

  def stamp_lists
    params[:month] = Date.current.strftime('%Y%m%d') unless params[:month]
    @month = (0..31).to_a.map{ |i| (Date.parse(params[:month]).beginning_of_month+i) if Date.parse(params[:month]).end_of_month.strftime('%d').to_i > i}.compact
    #@stamp_list = TimeStamp.where(user_id: current_user)
    @date = Date.parse(params[:month])
  end

  def show
    @stamp = TimeStamp.find(params[:id])
  end

  def update
    @stamp = TimeStamp.find(params[:id])
    #パラメータをstart_timeの各日付と時間(1i~5i)に割り当て
    # @stamp.start_time = Time.new(params[:time_stamp]['start_time(1i)'].to_i, params[:time_stamp]['start_time(2i)'].to_i, params[:time_stamp]['start_time(3i)'].to_i, params[:time_stamp]['start_time(4i)'].to_i, params[:time_stamp]['start_time(5i)'].to_i)
    #パラメータをend_timeの各日付と時間(1i~5i)に割り当て
    # @stamp.end_time = Time.new(params[:time_stamp]['end_time(1i)'].to_i, params[:time_stamp]['end_time(2i)'].to_i, params[:time_stamp]['end_time(3i)'].to_i, params[:time_stamp]['end_time(4i)'].to_i, params[:time_stamp]['end_time(5i)'].to_i)
    
    if @stamp.update
      #binding.pry
      redirect_to stamp_list_path, notice: "正常に更新しました"
    else
      render :show
    end
  end
end
