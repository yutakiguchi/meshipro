class ApplicationController < ActionController::Base
  before_action :config_permitted_parameters,if: :devise_controller?

  def config_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:nickname])
  end

  def after_sign_in_path_for(resource)
   case resource
    when Cock
     cock_path(current_cock)
    when User
     public_recipes_path
   end
  end

end
