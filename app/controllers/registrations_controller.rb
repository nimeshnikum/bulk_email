class RegistrationsController < Devise::RegistrationsController
#  before_filter :authenticate_user!, :only => :new
  skip_before_filter :require_no_authentication, :except => :cancel

  protected

    def after_update_path_for(resource)
      user_path(resource)
    end
end
