class RenameDateColumnToDays < ActiveRecord::Migration[6.1]
  def change
    rename_column :days, :date, :day
  end
end
