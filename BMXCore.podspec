Pod::Spec.new do |s|
  s.name = 'BMXCore'
  s.version = '1.0.11'
  s.swift_version = '5.3'
  s.source = { :git => 'https://github.com/runslikebutter/butterflymx-ios-sdk.git', :tag => s.name+'_'+s.version.to_s }

  s.summary = 'A Swift framework to implement ButterflyMX SDK'
  s.homepage = 'https://github.com/runslikebutter/butterflymx-ios-sdk'
  s.author = {'butterflymx' => 'admin@butterflymx.com'}
  s.license = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.platform = :ios
  s.ios.deployment_target = '10.0'
  s.ios.vendored_frameworks = 'BMXCore.xcframework'

  s.dependency 'Japx/CodableAlamofire', '~> 3.0.0'
  s.dependency 'Alamofire', '~> 5.2.1'
  s.dependency 'OAuthSwift', '~> 2.1.0'
end