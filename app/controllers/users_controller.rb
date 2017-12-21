class UsersController < ApplicationController
  before_action :authenticate_user!,　only: [:search]

  def index
   @users = User.order('id ASC')
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(user_params)
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to :root, alert: '登録内容を変更しました'
    else
      flash[:alert]='登録内容を変更してください'
      render :edit
    end
  end

  def search
      @user = User.where('name LIKE(?)', "#{params[:keyword]}%")
     respond_to do |format|
       format.html
       format.json
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :email,
    )
  end
end
