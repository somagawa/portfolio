class PostsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit]

  def ensure_correct_user
    post = Post.find(params[:id])
    if current_user.id != post.user_id
      redirect_to posts_path
    end
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save
  		redirect_to posts_path
  	else
  		render "posts/new"
  	end
  end

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  		redirect_to posts_path
  	else
  		render "posts/edit"
  	end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
  	params.require(:post).permit(:title, :body, :image)
  end
end
