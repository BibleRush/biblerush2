class AddIndexesToPassages < ActiveRecord::Migration
  def change
    add_index :passages, [:version, :book, :en_book, :chapter, :verse], :name => 'passage_composite'
  end
end
