# encoding: UTF-8

class Utils
  def self.bgateway_link(passage, version='NIV;CUVMPS')
    "http://www.biblegateway.com/passage/?search=#{passage}&version=#{version}"
  end
end
