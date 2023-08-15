class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :day_id,        null: false, foreigh_key: true
      t.datetime :start_at,     null: false
      t.datetime :finished_at,  null: false
      t.string :place,          null: false
      t.text :schedule_comment, null: false
      t.string :cost,           null: false
      t.integer :transportation, null: false, default: 0
      t.string :transfer_time,  null: false
      t.string :expense,        null: false

      t.timestamps
    end
  end
end
