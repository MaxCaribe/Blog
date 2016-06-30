class ScreenshotMailer <  ActionMailer::Base
  default to: Proc.new { User.pluck :email },
          from: 'mailforrailsmax@gmail.com'

  def send_screenshot
    mail(:subject => 'Testing!',:body => 'Some text there')
  end
end