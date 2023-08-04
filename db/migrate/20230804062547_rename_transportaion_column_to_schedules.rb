class RenameTransportaionColumnToSchedules < ActiveRecord::Migration[6.1]
  def change
    rename_column :schedules, :transportaion, :transportation
  end
end
