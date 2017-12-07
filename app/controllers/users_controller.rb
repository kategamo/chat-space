class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
  current_user.update(user_params)
  redirect_to :root
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
    )
  end

end
