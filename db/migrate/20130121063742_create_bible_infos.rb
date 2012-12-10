class CreateBibleInfos < ActiveRecord::Migration
  def change
    create_table :bible_infos do |t|
      t.string  :version
      t.string  :book
      t.integer :chapters

      t.timestamps
    end

    add_index :bible_infos, :version
  end
end
