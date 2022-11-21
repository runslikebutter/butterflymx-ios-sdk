Pod::Spec.new do |s|
  s.name = 'BMXCall'
  s.version = '2.3'
  s.swift_version = '5.3'
  s.source = { :http => 'https://github.com/runslikebutter/butterflymx-ios-sdk/raw/'+s.name+'_'+s.version.to_s+'/BMXCall.zip' }

  s.summary = 'A Swift framework to implement ButterflyMX SDK'
  s.homepage = 'https://github.com/runslikebutter/butterflymx-ios-sdk'
  s.author = {'butterflymx' => 'admin@butterflymx.com'}
  s.license = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.platform = :ios
  s.ios.deployment_target = '12.2'
  s.vendored_frameworks = 'BMXCall.xcframework'

  s.dependency 'BMXCore', '~> 2.3'
  s.dependency 'TwilioVideo', '~> 5.1'
end