# -*- encoding : utf-8 -*-
class Members::DiariesController < Members::ApplicationController  
  
  def show
    add_crumb "Tagebuch", members_diary_path
    @diary_entries = current_user.diary_entries

    @json_events = []
    @diary_entries.each do |diary_entry|
      @json_events << {:title => "G: #{diary_entry.weight}", :start => diary_entry.entry_date}
    end    

    @json_events = @json_events.to_json
  end

end
