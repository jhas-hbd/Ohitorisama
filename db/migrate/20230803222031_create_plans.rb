class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.integer :user_id,      null: false
      t.string :title,         null: false
      t.integer :prefecture,   null: false, default: 0
      t.integer :stay_days,    null: false, default: 0
      t.integer :budget,       null: false, default: 0
      t.integer :main_vehicle, null: false, default: 0
      t.text :impression,      null: false

      t.timestamps
    end
  end
end
