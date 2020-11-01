Pod::Spec.new do |spec|

  spec.name         = "MailPresenter"
  spec.version      = "0.0.1"
  spec.summary      = "iOS mail clients presenter."
  spec.description  = <<-DESC
  Interact with third-party iOS mail clients, using custom URL schemes
                   DESC

  spec.homepage     = "https://github.com/thanhdolong/mail-presenter"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  spec.license      = "MIT (example)"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author       = { "Do Long Thanh" => "thanh.dolong@gmail.com" }


  spec.platform     = :ios
  spec.platform     = :ios, "5.0"
  spec.ios.deployment_target = "10.0"


  spec.source       = { :git => "https://github.com/thanhdolong/mail-presenter.git", :tag => "#{spec.version}" }
  spec.source_files  = "MailPresenter", "MailPresenter/**/*.{h,m}"
  spec.framework  = "UIKit"
  spec.requires_arc = true

end
