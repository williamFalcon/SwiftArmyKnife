Pod::Spec.new do |s|
  s.name = 'JString'
  s.version = '1.0.0'
  s.summary = 'Javascript syntax for Swift Strings'
  s.homepage = 'https://github.com/williamFalcon/JString'
  s.license = 'MIT'
  s.author = { 'williamFalcon' => 'will@hacstudios.com' }
  s.social_media_url = 'https://twitter.com/_willfalcon'
  s.source = { :git => 'https://github.com/williamFalcon/JString.git', :tag => "v#{s.version}" }
  s.source_files = 'JString/**/*.{h,m,swift}'
  s.public_header_files = 'JString/**/*.{h,m, swift}'
  s.requires_arc = true
  s.platform = :ios, '7.0'
end
