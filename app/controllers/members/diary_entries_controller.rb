# -*- encoding : utf-8 -*-
class Members::DiaryEntriesController < Members::ApplicationController  
  
  def create
    diary_entry = DiaryEntry.new params[:diary_entry]
    diary_entry.user = current_user

    if diary_entry.save
      redirect_to members_diary_path
    else
      flash[:warning] = "Fehler beim speichern!"
      redirect_to members_diary_path
    end
  end

end
