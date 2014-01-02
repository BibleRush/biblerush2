class AddCommmentsCountToPlanDetails < ActiveRecord::Migration
  def change
    add_column :plan_details, :comments_count, :integer, :default => 0
  end
end
