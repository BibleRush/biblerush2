# encoding: UTF-8

require 'spec_helper'

# configure here since we are not including spec_helper
VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
end

describe BibleVersionsParser do
  describe '.parse_chinesev1' do
    it 'get book/chapters for v1 chinese bible' do
      VCR.use_cassette('biblegateway') do
        info = BibleVersionsParser.parse_chinesev1

        info.first.version.should == 'Chinese New Testament: Easy-to-Read Version'
        info.first.book.should == '馬 太 福 音'
        info.first.chapters.should == 28

        info.last.book.should == '启 示 录'
        info.last.chapters.should == 22
      end
    end

    #it 'foo' do
      #VCR.use_cassette('biblegateway', :record => :all) do
        #BibleVersionsParser.fill_biblev1
      #end
    #end
  end
end
