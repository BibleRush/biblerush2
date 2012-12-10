class BibleInfo < ActiveRecord::Base
  attr_accessible :book, :chapters, :version
end
