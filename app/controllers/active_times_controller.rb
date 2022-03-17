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
    binding.pry
    @stamp.date = Date.current
    @stamp.start_time = Time.current_user
    @stamp.end_time
    @stamp.day_total_time
    if @stamp.save
      redirect_to request.referer
    else
      @stamp = ActiveTime.new(active_time_params)
      @target = current_user.targets.all
      render :new
    end

  end

  def index

  end

  def show

  end

  def update

  end

  private

  def active_time_params
    params.require(:active_time).permit(:date,:start_time,:end_time,:day_total_time,:target_id)
  end

end
