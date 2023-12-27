class SearchesController < ApplicationController
  def search
     if params[:keyword].present?
      @posts = Post.where('post_place LIKE ?', "%#{params[:keyword]}%")
      @keyword = params[:keyword]
     else
      @posts = Post.all
     end
  end
end
