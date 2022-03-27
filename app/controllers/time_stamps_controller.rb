class TimeStampsController < ApplicationController

  def time_stamps
    @stamp = TimeStamp.find_by(end_time: nil, user_id: current_user.id)
  end

  def start_stamp
    start_time = TimeStamp.new(date: Date.current, start_time: Time.current, end_time: nil, user_id: current_user.id)
    if start_time.save
      flash[:notice] = "打刻を開始しました"
      redirect_to time_stamps_path
    else
      render :time_stamps
    end
  end

  def end_stamp
    stamp = TimeStamp.find(params[:id])
    stamp.update(end_time: Time.current)# binding.pry
    redirect_to time_stamps_path
  end

  def stamp_list
    params[:month] = Date.current.strftime('%Y%m%d') unless params[:month]
    @month = (0..31).to_a.map{ |i| (Date.parse(params[:month]).beginning_of_month+i) if Date.parse(params[:month]).end_of_month.strftime('%d').to_i > i}.compact
    #@stamp_list = TimeStamp.where(user_id: current_user)
    @date = Date.parse(params[:month])
  end

  def show
    @stamp = TimeStamp.find(params[:id])
  end
end
