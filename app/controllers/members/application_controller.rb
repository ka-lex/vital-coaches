# -*- encoding : utf-8 -*-
class Members::ApplicationController < ApplicationController  
  #layout "internal"
  before_filter :authenticate_user!

  before_filter :check_profile_created

  before_filter :do_breadcrumbs

  helper_method :breadcrumbs

  def breadcrumbs
    @crumbs
  end

  def add_crumb name, url
    @crumbs.push [name, url]    
  end

  private

  def do_breadcrumbs
    @crumbs = []
    @crumbs.push ["Start", members_root_path]    
  end

  def check_profile_created
  	unless request.fullpath == new_members_profile_path
  	  redirect_to new_members_profile_path if current_user.profile.nil?
  	end  	
  end
end
