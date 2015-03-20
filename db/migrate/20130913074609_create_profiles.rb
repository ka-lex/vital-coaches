# -*- encoding : utf-8 -*-
class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :body_height
      t.decimal :weight, :precision => 6, :scale => 2      
      t.references :user
      t.date :birthday
      t.integer :abdominal_measurement
      t.string :street
      t.string :street_number
      t.integer :zipcode
      t.string :city
      t.string :country
      t.string :bank_name
      t.string :bank_account
      t.string :bank_code
      t.string :bank_account_owner
      t.text :anamnesis

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
