# -*- encoding : utf-8 -*-
class AddGenderToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
  end
end
