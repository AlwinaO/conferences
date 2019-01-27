class ChangeColumnDate < ActiveRecord::Migration
  def change
    change_column :conferences, :date, :text
  end
end
