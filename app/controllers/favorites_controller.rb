class FavoritesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.build(post: @post, user: current_user)
    authorize @favorite
    if @favorite.save
      flash[:notice] = "You have successfully favorited the post."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error favoriting."
      redirect_to [@post.topic, @post]
    end
    byebug
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.where(post_id: @post.id)
    byebug
    authorize @favorite
    if @favorite.destroy
      flash[:notice]="Favorite was successfully removed"
      redirect_to [@post.topic,@post]
    else
      flash[:error]="There was an error removing the favorite"
      redirect_to [@post.topic,@post]
    end
  end
end
