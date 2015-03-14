# This class overrides the edefault redirect URL for signing -in/out. 
# There is not a similar override available for the registration.
class CustomFailure < Devise::FailureApp
  def redirect_url
    root_path
  end
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end