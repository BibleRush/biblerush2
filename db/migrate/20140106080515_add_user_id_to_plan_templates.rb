class AddUserIdToPlanTemplates < ActiveRecord::Migration
  def change
    add_column :plan_templates, :user_id, :integer, :default => 1
  end
end
