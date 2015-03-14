module ApplicationHelper
    # Fix to get devise forms working within the application scope and not just the gem:
  # http://pupeno.com/2010/08/29/show-a-devise-log-in-form-in-another-page/
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def day
    @day = Time.now
    @day.strftime('%A')
  end

end
