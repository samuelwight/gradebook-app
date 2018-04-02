class CreateCredentials < ActiveRecord::Migration[5.1]
  def change
    create_table :credentials do |t|
      t.references :user, foreign_key: true
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
