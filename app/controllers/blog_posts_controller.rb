class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost::all #@blog_posts is an instance that passes to the view
  end

  def show 
    @blog_post = BlogPost::find(params[:id]) 
    rescue 
      redirect_to root_path
  end
end
