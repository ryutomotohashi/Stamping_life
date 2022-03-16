class ActiveTimesController < ApplicationController

  def index
    @time = ActiveTime.new
  end

  def create
    t = DateTime.now(date: t.year&t.month&t.day)
  end

  def show

  end

  def update

  end

end
