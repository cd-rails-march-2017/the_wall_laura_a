class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    @comment.comment = params[:comment]
    @comment.user_id = session[:user_id]
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to '/posts'
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to '/posts'
    end
  end
end
