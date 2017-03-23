class PostsController < ApplicationController
  def index
    @posts = Post.all
    @comments = Comment.all
  end

  def new
  end

  def create
    @post = Post.new
    @post.post = params[:post]
    @post.user_id = session[:user_id]
    if @post.save
      redirect_to '/posts'
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to '/posts'
    end
  end
end
