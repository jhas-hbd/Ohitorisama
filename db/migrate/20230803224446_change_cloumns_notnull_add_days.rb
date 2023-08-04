class ChangeCloumnsNotnullAddDays < ActiveRecord::Migration[6.1]
  def change
    change_column :days, :plan_id, :integer, null: false
  end
end
