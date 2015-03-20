class PasswordsController < Devise::PasswordsController

  def create 
    # super

    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      render pages_signin_path
      
      # Original redirect
      # respond_with(resource)
    end
  end

end