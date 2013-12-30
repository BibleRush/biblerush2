set :output, "#{path}/log/cron_log.log"

every 1.day, :at => '11:45 am' do
  rake "rush:plan_reminder_emails"
end
