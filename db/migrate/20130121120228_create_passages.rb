class CreatePassages < ActiveRecord::Migration
  def change
    create_table :passages do |t|
      t.string  :version
      t.string  :book
      t.string  :en_book
      t.text    :text
      t.integer :chapter
      t.integer :verse

      t.timestamps
    end

    add_index :passages, :version
    add_index :passages, :book
    add_index :passages, :en_book
    add_index :passages, :chapter
    add_index :passages, :verse
  end
end
