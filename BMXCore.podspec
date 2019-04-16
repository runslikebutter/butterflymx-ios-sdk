Pod::Spec.new do |s|
  s.name = 'BMXCore'
  s.version = '1.0'
  s.swift_version = '4.2'
  s.source = { :http => 'https://github.com/runslikebutter/butterflymx-ios-sdk/raw/master/BMXCore.zip', :flatten => true }

  s.summary = 'A Swift framework to implement ButterflyMX SDK'
  s.homepage = 'https://github.com/runslikebutter/butterflymx-ios-sdk'
  s.author = {'butterflymx' => 'admin@butterflymx.com'}
  s.license = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.platform = :ios
  s.ios.deployment_target = '10.0'
  s.ios.vendored_frameworks = 'BMXCore.framework'

  s.dependency 'Alamofire'
  s.dependency 'Japx/CodableAlamofire'
end