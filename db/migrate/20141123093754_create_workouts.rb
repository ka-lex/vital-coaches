class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.references :user

      t.timestamps
    end
    add_index :workouts, :user_id
  end
end
