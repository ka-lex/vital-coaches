class DiaryEntry < ActiveRecord::Base
  belongs_to :user
  attr_accessible :entry_date, :weight, :weight
end
