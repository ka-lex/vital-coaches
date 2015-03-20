# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(user)
    members_root_url
  end
  
end
