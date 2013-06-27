class CreateInvites < ActiveRecord::Migration
  def change
    create_table(:invites) do |t|
      t.string :email, :null => false, :default => ""
      t.string :avatar, :null => false, :default => ""
      t.integer :invited_by, :null => false, :default => ""
      t.integer :plan_id
      t.boolean :accepted, :default => false

      t.timestamps
    end

    add_index :invites, [:plan_id, :email]
  end
end
