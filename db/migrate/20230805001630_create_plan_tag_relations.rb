class CreatePlanTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_tag_relations do |t|
      t.integer :plan_id, null: false, foreign_key: true
      t.integer :tag_id, null: false, foreign_key: true

      t.timestamps
    end
    add_index :plan_tag_relations, [:plan_id,:tag_id],unique: true
  end
end
