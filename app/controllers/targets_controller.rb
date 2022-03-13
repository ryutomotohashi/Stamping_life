class TargetsController < ApplicationController


  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    @target.user_id = current_user.id
    @target.save
    redirect_to user_path(current_user)
  end

  def index
    @targets = Target.all
  end

  def show
    @target = Target.find(params[:id])
  end

  def edit
    @target = Target.find(params[:id])
  end

  def update
    @target = Target.find(params[:id])
    @target.update(target_params)
    redirect_to user_path(current_user)
  end

  private

  def target_params
    params.require(:target).permit(:title, :description)
  end
end
