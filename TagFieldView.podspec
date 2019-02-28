
Pod::Spec.new do |s|
  s.name             = 'TagFieldView'
  s.version          = '0.1.0'
  s.summary          = 'TagFieldView is micro library to input tag'


  s.description      = <<-DESC
 using TagFieldView makes it easy to make tag-based ui and hoge hoge 
                      DESC

  s.homepage         = 'https://github.com/churabou/TagFieldView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'churabou' => 'ginga7888@gmail.com' }
  s.source           = { :git => 'https://github.com/churabou/TagFieldView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TagFieldView/Classes/**/*'
  s.swift_version = "4.2"
end
