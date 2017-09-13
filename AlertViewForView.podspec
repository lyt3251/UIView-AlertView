#
#  Be sure to run `pod spec lint AlertViewForView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|



  s.name         = "AlertViewForView"
  s.version      = "1.0.0"
  s.summary      = "alert view from uiview "


  s.description  = <<-DESC
  							alert view from uiview .
                   DESC

  s.homepage     = "https://github.com/lyt3251/UIView-AlertView"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"



  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }



  s.author             = { "lyt323.student" => "lyt323.student@sina.com" }
  
  s.platform     = :ios, "8.0"

 

  s.source       = { :git => "https://github.com/lyt3251/UIView-AlertView.git", :tag => "#{s.version}" }


  

  s.source_files  = "UIView-AlertView/UIView-AlertViewSources/*.{h,m}"
  


  
  s.frameworks = "UIKit", "Foundation"

 
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  #s.dependency "CustomIOSAlertView", "~> 0.9.5"
  s.dependency "BlockUI", "~> 1.0.0"
end
