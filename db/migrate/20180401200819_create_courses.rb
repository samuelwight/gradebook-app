class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :teacher
      t.integer :period

      t.timestamps
    end
  end
end
