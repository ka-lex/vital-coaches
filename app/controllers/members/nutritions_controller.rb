# -*- encoding : utf-8 -*-
class Members::NutritionsController < Members::ApplicationController

  before_filter :set_values
  before_filter :set_breadcrumb

  def show    
  end

  def lecture
    add_crumb "Ernährungsvideos", members_videos_nutrition_path

    #render "lektion#{params[:lecture_id]}"
    @lecture = get_lecture params[:lecture_id]
    #@lecture = params[:lecture_id]
    render "lecture"
  end

  private

  def get_lecture id    
    result = nil
    @lecutures.each do |lecture|
      result = lecture if lecture[:id] == id.to_i
    end
    result
  end

  def set_breadcrumb
    add_crumb "Videos", members_videos_nutrition_path
    
  end

  def set_values
    @lecutures = [
      {:id => 1, :name => "JoJo-Effekt", :description => "JoJo-Effekt verhindern; warum Diäten nicht funktionieren", :video_description => 
        "In der ersten Video-Lektion führen wir Dich in die Grundlagen ein. Nachdem Du das Video zu Ende gesehen hast beginnt das Quiz. Dort wird mit einfachen Fragen abgeprüft, ob Du auch gut zugesehen hast :)", 
        :video_id => "5OVT2bVwIBE"
      },
      {:id => 2, :name => "Blutzucker", :description => "Blutzucker", :video_description => "in der zweiten Lektion erfährst Du, was Hunger auslöst und wie wir das Wissen für unsere Ernährung nutzen können.", 
        :video_id => "GtPOhwY94_w"
        },
      {:id => 3, :name => "Gewicht", :description => "Übergewicht erkennen"},
      {:id => 4, :name => "Zählen", :description => "Kalorienzählen: sinnvoll oder nicht?"},
      {:id => 5, :name => "Alltag", :description => "Ernährungsgewohnheiten ändern"},
      {:id => 6, :name => "Frühstück", :description => "Frühstück"},
      {:id => 7, :name => "Mittags", :description => "Mittagessen"},
      {:id => 8, :name => "Abends", :description => "Abendessen"},
      {:id => 9, :name => "K.hydrate", :description => "Kohlenhydrate"},
      {:id => 10, :name => "Eiweis", :description => "Eiweis"},
      {:id => 11, :name => "Fette", :description => "Fette"},
      {:id => 12, :name => "Vitamine", :description => "Vitamine"},
      {:id => 13, :name => "Getränke", :description => "Getränke"},
      {:id => 14, :name => "Sport", :description => "Sport"},
      {:id => 15, :name => "Fazit", :description => "Fazit aus Staffel 1"}
      ]
  end
end
