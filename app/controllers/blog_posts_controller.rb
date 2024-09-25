class BlogPostsController < ApplicationController
  # Get all the model objects
  def index
    @blog_posts = BlogPost::all #@blog_posts is an instance that passes to the view
  end

  # Get items with an specific id
  def show 
    @blog_post = BlogPost::find(params[:id]) 
    rescue 
      redirect_to root_path
  end

  # Show new items form
  def new  
    @blog_post = BlogPost::new
  end

  # Create new model object from the `form`
  def create
     @blog_post = BlogPost.new(blog_post_params)
     
     if @blog_post.save
      # redirect_to blog_post_path(@blog_post.id)
      redirect_to @blog_post
     else
      render :new, status: :unprocessable_entity
     end
  end


  def edit 
  end



  private
  # Use to give security in bulk insertion
  def blog_post_params
    params.require(:blog_post).permit(:title, :body) 
  end
end
