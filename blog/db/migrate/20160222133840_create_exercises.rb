class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :muscle_group

      t.timestamps null: false
    end
  end
end
