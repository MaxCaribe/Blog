namespace :mail do
  desc 'Sending email messages'
  task(:send_mail => :environment) do
    ScreenshotMailer.send_screenshot.deliver!
  end
end