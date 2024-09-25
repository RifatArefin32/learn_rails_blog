class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost::all #@blog_posts is an instance that passes to the view
  end

  def show 
    @blog_post = BlogPost::find(params[:id]) 
    rescue 
      redirect_to root_path
  end

  def new  
    @blog_post = BlogPost::new
  end

  def create
     @blog_post = BlogPost.new(blog_post_params)
     
     if @blog_post.save
      # redirect_to blog_post_path(@blog_post.id)
      redirect_to @blog_post
     else
      render :new, status: :unprocessable_entity
     end
     
     
     @blog_post.save
  end




  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body) 
  end
end
