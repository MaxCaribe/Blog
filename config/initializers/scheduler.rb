require 'rufus-scheduler'
require 'rubygems'

scheduler = Rufus::Scheduler.new

scheduler.cron '0 12 * * *' do #each day at 12:00 run rake task
  system 'bundle exec rake mail:send_mail'
end
