class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.role == 'professional'
    	'/plans'
    else
    	root_path
    end
  end

  def after_inactive_sign_up_path_for(resource)
    if resource.role == 'professional'
    	'/plans'
    else
    	root_path
    end
  end

end