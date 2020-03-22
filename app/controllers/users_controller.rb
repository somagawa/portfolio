class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit]

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to posts_path
    end
  end

  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(current_user)
  	else
  		render "users/edit"
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
