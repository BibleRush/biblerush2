class CreatePlanDetails < ActiveRecord::Migration
  def change
    create_table :plan_details do |t|
      t.string  :passage_ref
      t.date    :assigned_date
      t.integer :plan_id

      t.timestamps
    end

    add_index :plan_details, :passage_ref
    add_index :plan_details, :assigned_date
    add_index :plan_details, :plan_id
  end
end
