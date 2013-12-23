class AddOptInToUsers < ActiveRecord::Migration
  def change
    add_column :users, :opt_in, :boolean, :default => true
  end
end
