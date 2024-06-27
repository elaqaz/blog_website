class FavoritesController < ApplicationController
  before_action :require_login

  def create
    blog = Blog.find(params[:blog_id])
    current_user.favorites.create(blog: blog)
    redirect_to blog, notice: 'Added to favorites.'
  end

  def destroy
    blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.find_by(blog: blog)
    favorite.destroy
    redirect_to blog, notice: 'Removed from favorites.'
  end

  private

  def require_login
    unless current_user
      flash[:error] = 'You must be logged in to access this section'
      redirect_to new_session_path
    end
  end
end
