class UsersController < ApplicationController
  # before_action :authenticate_user!
  # before_action :user_find
  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to :root, alert: '登録内容を変更しました'
    else
      flash[:alert]='登録内容を変更してください'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
    )
  end

  def user_find
    @user = User.find(params[:id])
  end


end
