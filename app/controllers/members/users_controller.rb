# -*- encoding : utf-8 -*-
class Members::UsersController < Members::ApplicationController
	# even a singular resource like account needs a pluralized controller, see http://guides.rubyonrails.org/routing.html#singular-resources  

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to members_profile_path
    else
      # add a error message
      redirect_to members_profile_path
    end
  end
  
end
