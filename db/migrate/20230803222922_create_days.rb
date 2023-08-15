class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.integer :plan_id, null: false, foreigh_key: true
      t.date :day, null: false

      t.timestamps
    end
  end
end
