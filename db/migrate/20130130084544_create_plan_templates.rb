class CreatePlanTemplates < ActiveRecord::Migration
  def change
    create_table :plan_templates do |t|
      t.string  :name
      t.text    :desc
      t.integer :order

      t.timestamps
    end

    add_index :plan_templates, [:name, :order]
  end
end
