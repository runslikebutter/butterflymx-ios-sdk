Pod::Spec.new do |s|
  s.name = 'BMXCore'
  s.version = '2.2.1'
  s.swift_version = '5.3'
  s.source = { :http => 'https://github.com/runslikebutter/butterflymx-ios-sdk/raw/'+s.name+'_'+s.version.to_s+'/BMXCore.zip' }

  s.summary = 'A Swift framework to implement ButterflyMX SDK'
  s.homepage = 'https://github.com/runslikebutter/butterflymx-ios-sdk'
  s.author = {'butterflymx' => 'admin@butterflymx.com'}
  s.license = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.platform = :ios
  s.ios.deployment_target = '12.0'
  s.vendored_frameworks = 'BMXCore.xcframework'

  s.dependency 'Japx/Alamofire'
  s.dependency 'Alamofire', '~> 5.2'
  s.dependency 'OAuthSwift', '2.1.0'
end