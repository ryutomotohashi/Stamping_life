class TargetCommentsController < ApplicationController

  def create
    target = Target.find(params[:target_id])
    @comment = TargetComment.new(target_comment_paraams)
    @comment.user_id = current_user.id
    @comment.target_id = target.id
    @comment.save
    redirect_to request.referer
  end

  def destroy
    @comment = TargetComment.find_by(id: params[:id], target_id: params[:target_id])
    @comment.destroy
    redirect_to request.referer
  end

  private

  def target_comment_paraams
    params.require(:target_comment).permit(:comment)
  end
end
