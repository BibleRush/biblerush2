class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string  :name
      t.integer :user_id
      t.text    :desc

      t.timestamps
    end

    add_index :plans, :name
    add_index :plans, :user_id
  end
end
