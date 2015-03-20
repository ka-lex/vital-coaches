class CreateDiaryEntries < ActiveRecord::Migration
  def change
    create_table :diary_entries do |t|
      t.date :entry_date
      t.decimal :weight, :precision => 5, :scale => 2      
      t.references :user

      t.timestamps
    end
    add_index :diary_entries, :user_id
  end
end
