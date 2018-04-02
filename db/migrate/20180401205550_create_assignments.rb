class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.references :course, foreign_key: true
      t.integer :timestamp
      t.string :category
      t.string :name
      t.boolean :graded
      t.boolean :late
      t.integer :score
      t.integer :max_score
      t.string :letter_grade
      t.string :comment

      t.timestamps
    end
  end
end
