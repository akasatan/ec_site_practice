class UsersController < ApplicationController
  def show
  end
  
  def edit
  end

  def update
    @user = current_user
    if @user.save
      redirect_to show_users_path(current_user)
    else
      render show
    end
  end
  
  
end
