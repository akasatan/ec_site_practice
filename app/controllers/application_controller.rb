class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  protected
  def after_sign_in_path_for(resource)
    case resource
     when Admin
      admins_products_path
     when User
      products_path
    end
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end

end
