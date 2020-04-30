Pod::Spec.new do |s|
  s.name = 'BMXCore'
  s.version = '1.0.8'
  s.swift_version = '5.0'
  s.source = { :http => 'https://github.com/runslikebutter/butterflymx-ios-sdk/raw/'+s.name+'_'+s.version.to_s+'/BMXCore.zip', :flatten => true }

  s.summary = 'A Swift framework to implement ButterflyMX SDK'
  s.homepage = 'https://github.com/runslikebutter/butterflymx-ios-sdk'
  s.author = {'butterflymx' => 'admin@butterflymx.com'}
  s.license = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.platform = :ios
  s.ios.deployment_target = '10.0'
  s.ios.vendored_frameworks = 'BMXCore.framework'

  s.dependency 'Japx/CodableAlamofire', '~> 2.0.2'
  s.dependency 'Alamofire', '~> 4.9.1'
  s.dependency 'OAuthSwift', '~> 2.1.0'
end