class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def edit
  end

  before_action :flash_attack
  protected
  def flash_attack
    flash[:update] = "Testing"
  end
end
