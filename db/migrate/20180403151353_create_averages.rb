class CreateAverages < ActiveRecord::Migration[5.1]
  def change
    create_table :averages do |t|
      t.integer :timestamp
      t.integer :average
      t.integer :course_id

      t.timestamps
    end
    add_index :averages, :course_id
  end
end
