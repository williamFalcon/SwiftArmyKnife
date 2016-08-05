Pod::Spec.new do |s|
  s.name = 'SwiftArmyKnife'
  s.version = '1.2.1'
  s.license = 'MIT'
  s.summary = 'Useful extensions for every iOS class in Swift'
  s.homepage = 'https://github.com/williamFalcon/SwiftArmyKnife'
  s.authors = { 'William Falcon' => 'will@hacstudios.com' }
  s.source = { :git => 'https://github.com/williamFalcon/SwiftArmyKnife.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Source/**/*.swift'
end