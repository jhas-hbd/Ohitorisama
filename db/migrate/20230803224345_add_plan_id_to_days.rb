class AddPlanIdToDays < ActiveRecord::Migration[6.1]
  def change
    add_column :days, :plan_id, :integer
  end
end
