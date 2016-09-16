class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user=User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        render 'new'
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
end
