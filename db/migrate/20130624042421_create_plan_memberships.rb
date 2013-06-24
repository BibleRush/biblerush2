class CreatePlanMemberships < ActiveRecord::Migration
  def change
    create_table :plan_memberships do |t|
      t.integer  :plan_id
      t.integer  :user_id

      t.timestamps
    end

    add_index :plan_memberships, [:plan_id, :user_id], :unique => true
  end
end
