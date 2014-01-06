class AddPublicToPlanTemplates < ActiveRecord::Migration
  def change
    add_column :plan_templates, :public, :boolean, :default => true
  end
end
