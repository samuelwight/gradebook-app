class AddColumnsToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :year_id, :integer
    add_column :courses, :nine_weeks_id, :integer
    add_column :courses, :class_id, :string
  end
end
