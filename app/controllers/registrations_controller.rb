class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    if resource.save
      # insert redirect_to logic -> profile page
    else
      clean_up_passwords resource
      render pages_index_path
    end 
  end

  protected

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

end 