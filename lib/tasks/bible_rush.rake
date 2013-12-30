namespace :rush do
  desc 'test emails'
  task :plan_reminder_emails => :environment do
    #UserMailer.invite_to_plan_email(invite).deliver
  end

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

  desc 'create NL reading plan'
  task :create_nl_plan => :environment do
    # Matthew 1-28, Psalm 65
    # John 1-21
    # Galatians 1-6
    # Ephesians 1-6
    # Philippians 1-4
    plan_name = 'New Life Reading Plan'
    PlanTemplate.where(name: plan_name).destroy_all
    template = PlanTemplate.create(name: plan_name, desc: 'New Life reading plan')

    (1..65).each do |chapter|
      case chapter
      when 1..28
        template.plan_template_details.build(passage_ref: "Matthew #{chapter}, Psalm #{chapter}")
        puts template.plan_template_details.last.passage_ref
      when 29..49
        template.plan_template_details.build(passage_ref: "John #{chapter - 28}, Psalm #{chapter}")
        puts template.plan_template_details.last.passage_ref
      when 50..55
        template.plan_template_details.build(passage_ref: "Galatians #{chapter - 28 - 21}, Psalm #{chapter}")
        puts template.plan_template_details.last.passage_ref
      when 56..61
        template.plan_template_details.build(passage_ref: "Ephesians #{chapter - 28 - 21 - 6}, Psalm #{chapter}")
        puts template.plan_template_details.last.passage_ref
      when 62..65
        template.plan_template_details.build(passage_ref: "Philippians #{chapter - 28 - 21 - 6 - 6}, Psalm #{chapter}")
        puts template.plan_template_details.last.passage_ref
      end
    end

    puts "saving template: #{template.inspect}"
    template.save!
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
