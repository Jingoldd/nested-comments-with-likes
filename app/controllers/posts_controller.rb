class PostsController < ApplicationController
  before_action :find_post, except: [:new, :create, :index]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all 
    @posts = @posts.order("created_at DESC")
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post successfully created"
    else
      render :new
    end 
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully"
    else
      render :edit 
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Post successfully deleted" 
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end 

  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user[:id])
  end 

end
