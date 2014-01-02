require 'open-uri'

# one off utils that hopefully only get run once
module OneOff
  extend self

  module Bst
    extend self

    def book_order
      plan_name = 'Whole Bible - Book Order'
      plan_desc = 'Read from Genesis to Revelation in the order arranged in the Bible.'
      url = 'http://www.biblestudytools.com/bible-reading-plan/book-order.html'
      OneOff.scrape_bst(plan_name, plan_desc, url)
    end

    def daily_wisdom
      plan_name = 'Daily Wisdom'
      plan_desc = 'Find wisdom each day as you read straight through the Psalms, Proverbs, and Song of Solomon in 60 days.'
      url = 'http://www.biblestudytools.com/bible-reading-plan/daily-wisdom.html'
      OneOff.scrape_bst(plan_name, plan_desc, url)
    end

    def chronological_nt
      plan_name = 'Chronological New Testament'
      plan_desc = 'In only 3 months you can read the New Testament in the order that the events happened.'
      url = 'http://www.biblestudytools.com/bible-reading-plan/chronological-new-testament.html'
      OneOff.scrape_bst(plan_name, plan_desc, url)
    end

    def daily_gospel
      plan_name = 'Daily Gospel'
      plan_desc = "This plan focuses on the record of the life of Christ. You'll read through all four gospels in 45 days."
      url = 'http://www.biblestudytools.com/bible-reading-plan/daily-gospel.html'
      OneOff.scrape_bst(plan_name, plan_desc, url)
    end

    def daily_psalm
      plan_name = 'Daily Psalm'
      plan_desc = "Read one Psalm per day for a spiritual boost."
      url = 'http://www.biblestudytools.com/bible-reading-plan/daily-psalm.html'
      OneOff.scrape_bst(plan_name, plan_desc, url)
    end

    def nt
      plan_name = 'New Testament'
      plan_desc = 'Read straight through the New Testament in 90 days.'
      url = 'http://www.biblestudytools.com/bible-reading-plan/new-testament-in-ninety-days.html'
      OneOff.scrape_bst(plan_name, plan_desc, url)
    end
  end

  # scrape plans from biblestudytools.com
  def scrape_bst(plan_name, plan_desc, url)
    existing_template = PlanTemplate.where(name: plan_name)

    if existing_template.present?
      puts "template #{plan_name} already exists. exiting!"
      return
    end

    doc = Nokogiri::HTML(open(url))

    verses = doc.css('.plan-list > li')

    puts "creating plan template #{plan_name}"
    template = PlanTemplate.create(name: plan_name, desc: plan_desc)

    verses.each_with_index do |v, i|
      passage_ref = v.css('a').attribute('href').value.split('?').last.sub('q=', ' ').gsub('+',' ')
      template.plan_template_details.build(passage_ref: passage_ref)
    end

    template.save!

    puts "finished!"
  rescue => ex
    puts "there was an error!"
    puts ex
    raise ex
  end
end
