# -*- encoding : utf-8 -*-
class Members::PagesController < Members::ApplicationController
  def index
    current_user.reset_authentication_token!
  end
end
