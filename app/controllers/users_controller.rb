class UsersController < ApplicationController
  def show
  end
  
  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to show_users_path
  end
  
  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :kana_firstname, :kana_lastname, :postcode, :address, :phone_number, :email)
  end
  
end
