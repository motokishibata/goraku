class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new()
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(posts_params)
    
    if @post.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(posts_params)
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to posts_url
  end
  
  private
  
  def posts_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
