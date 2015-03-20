# -*- encoding : utf-8 -*-
module Members::ApplicationHelper

  def nav_list_elmement name, url, icon_name
    capture_haml do
      if current_page? url
        haml_tag(:li, :class => :active) do
          haml_tag :a, :href => url do
            haml_tag :i, :class => icon_name
            haml_tag "span.menu-text", name
          end
        end
      else
        haml_tag(:li) do
          haml_tag :a, :href => url do
            haml_tag :i, :class => icon_name
            haml_tag "span.menu-text", name
          end
        end
      end      
    end
  end  

end
