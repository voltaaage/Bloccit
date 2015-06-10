class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.build(comments_params)

    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end
    redirect_to [@topic,@post]
    byebug
  end

  def comments_params
    params.require(:comment).permit(:body,:post_id)
  end
end
