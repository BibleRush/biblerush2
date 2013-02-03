class CreatePlanTemplateDetails < ActiveRecord::Migration
  def change
    create_table :plan_template_details do |t|
      t.integer :plan_template_id
      t.string  :passage_ref
      t.integer :position

      t.timestamps
    end

    add_index :plan_template_details, [:plan_template_id, :position]
    add_index :plan_template_details, :passage_ref
    add_index :plan_template_details, [:plan_template_id, :passage_ref]
  end
end
