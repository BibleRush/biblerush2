class Passage < ActiveRecord::Base
  attr_accessible :book, :en_book, :chapter, :text, :verse, :version
end
