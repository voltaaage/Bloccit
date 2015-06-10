class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.current_user.comments.build(comment_params)
    authorize @comment
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new() 
    authorize @comment
  end

  def comment_params
    params.require(:comment).permit(:title,:body)
  end
end
