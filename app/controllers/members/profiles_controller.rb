# -*- encoding : utf-8 -*-
class Members::ProfilesController < Members::ApplicationController
	# even a singular resource like account needs a pluralized controller, see http://guides.rubyonrails.org/routing.html#singular-resources

  def show
    @profile = current_user.profile
    @user = current_user
  end

  def new
    current_user.reset_authentication_token!
    @user = current_user
    if @user.profile.nil?
      @user.profile = Profile.new
    end
  end

  def create
    @user = current_user    
    if @user.profile.update_attributes(params[:profile])
      render js: "window.location.pathname='#{members_profile_path}'"
    else
      render js: "alert('Daten Fehlerhaft');"
    end    
  end  
  
end
