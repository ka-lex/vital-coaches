# -*- encoding : utf-8 -*-
class Profile < ActiveRecord::Base
  belongs_to :user
  store :anamnesis, accessors: [:already_did_diets, :fruits_frequency, :fastfood_frequency, :snacks_frequency, :cooking,
    :personal_activity, :sports_frequency, :target], coder: JSON
  attr_accessible :abdominal_measurement, :bank_account, :bank_account_owner, 
    :bank_code, :bank_name, :birthday, :body_height, :city, :country, :street, :street_number, :weight, :weight, :zipcode, :already_did_diets, :fruits_frequency, :fastfood_frequency, :snacks_frequency, :cooking,
    :personal_activity, :sports_frequency, :target


    def birthday
    	if read_attribute(:birthday).nil?
    		return Date.today
    	else
    		read_attribute :birthday
    	end
    end
end
