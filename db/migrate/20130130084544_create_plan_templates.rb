class CreatePlanTemplates < ActiveRecord::Migration
  def change
    create_table :plan_templates do |t|
      t.string  :name
      t.text    :desc
      t.integer :position

      t.timestamps
    end

    add_index :plan_templates, [:name, :position]
  end
end
