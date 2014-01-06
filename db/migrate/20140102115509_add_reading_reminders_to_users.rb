class AddReadingRemindersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reading_reminders, :boolean, :default => true
  end
end
