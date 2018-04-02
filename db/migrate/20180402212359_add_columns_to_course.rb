class AddColumnsToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :year, :integer
    add_column :courses, :semester, :integer
  end
end
