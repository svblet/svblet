class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if signed_in?
        sign_out
      end
      sign_in @user
      redirect_to new_user_alternate_email_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by_slug(params[:id])
    @show_edit_button = false

    if signed_in? && is_current_user?(@user)
      @show_edit_button = true
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
