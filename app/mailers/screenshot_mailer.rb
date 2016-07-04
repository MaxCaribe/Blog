class ScreenshotMailer <  ActionMailer::Base

  require 'imgkit'

  default to: Proc.new { User.pluck :email },
          from: 'mailforrailsmax@gmail.com'

  def oldest_file(dir)
    Dir.entries(dir).map { |e|
      File.join(dir, e)
    }.select { |f|
      File.file? f
    }.sort_by { |f|
      File.mtime f
    }.first
  end

  def send_screenshot
    kit = IMGKit.new('http://localhost:3000')
    default_path = 'public/screenshots/'
    path = ''
    1.upto(5) { |val|
      unless File.file?(default_path + val.to_s + '.jpg')
        path = default_path + val.to_s + '.jpg'
        break
      else
        path = oldest_file(default_path)
      end
    }
    kit.to_file path
    attachments['filename.jpg'] = File.read(path)

    mail(:subject => 'Testing!',:body => 'Some text there')
  end
end