class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.string :category
      t.string :location
      t.date   :date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
