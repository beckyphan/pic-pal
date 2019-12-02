class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)

    redirect_to event_path(@comment.event_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :event_id, :description)
  end
end
