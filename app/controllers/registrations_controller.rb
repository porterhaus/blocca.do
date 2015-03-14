class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    if resource.save
      
    else
      clean_up_passwords resource
      render pages_index_path
    end 
  end

end 