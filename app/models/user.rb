# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, 
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :gender, :firstname, :lastname, :profile_attributes
  # attr_accessible :title, :body
  has_one :profile
  has_many :diary_entries
  has_many :workouts

  accepts_nested_attributes_for :profile
end
