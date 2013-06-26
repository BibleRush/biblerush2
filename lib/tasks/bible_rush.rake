namespace :rush do
  desc 'setup bible infos table'
  task :bible_infos_niv => :environment do
    BibleInfo.where(version: 'NIV').destroy_all

    file = File.read('fixtures/niv-book-chapters.json')
    infos = JSON.parse(file)

    infos.each do |info|
      BibleInfo.create(version: 'NIV', book: info.keys.first, chapters: info.values.first)
    end

    puts 'finished'
  end

  task :create_esther_template => :environment do
    PlanTemplate.where(name: 'Esther One A Day').destroy_all
    template = PlanTemplate.create(name: 'Esther One A Day', desc: 'Read one chapter of Esther a day. Part of our alpha test. If you see this it means you are special :)')

    10.times do |chapter|
      template.plan_template_details.build(passage_ref: "Esther #{chapter + 1}")
    end

    template.save!


    PlanTemplate.where(name: 'Revelation One A Day').destroy_all
    template = PlanTemplate.create(name: 'Revelation One A Day', desc: 'Read one chapter of Revelation a day. Part of our alpha test. If you see this it means you are special :)')

    22.times do |chapter|
      template.plan_template_details.build(passage_ref: "Revelation #{chapter + 1}")
    end

    template.save!


    PlanTemplate.where(name: 'Acts One A Day').destroy_all
    template = PlanTemplate.create(name: 'Acts One A Day', desc: 'Read one chapter of Acts a day. Part of our alpha test. If you see this it means you are special :)')

    28.times do |chapter|
      template.plan_template_details.build(passage_ref: "Acts #{chapter + 1}")
    end

    template.save!


    PlanTemplate.where(name: 'John One A Day').destroy_all
    template = PlanTemplate.create(name: 'John One A Day', desc: 'Read one chapter of John a day. Part of our alpha test. If you see this it means you are special :)')

    21.times do |chapter|
      template.plan_template_details.build(passage_ref: "John #{chapter + 1}")
    end

    template.save!
  end
end
