Pod::Spec.new do |s|
  s.name = 'ButterflyMX'
  s.version = '0.13.3'
  s.swift_version = '4.2'
  s.source = { :http => 'https://github.com/runslikebutter/butterflymx-ios-sdk/raw/master/ButterflyMX.zip', :flatten => true }

  s.summary = 'A Swift framework to implement ButterflyMX SDK'
  s.homepage = 'https://github.com/runslikebutter/butterflymx-ios-sdk'
  s.author = {'butterflymx' => 'admin@butterflymx.com'}
  s.license = { :type => 'Apache-2.0', :file => 'LICENSE' }

  s.platform = :ios

  s.ios.deployment_target = '10.0'

  s.ios.preserve_path = 'pjsip/include/module.modulemap'
  s.ios.preserve_paths = 'pjsip/**/*'
  s.ios.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/ButterflyMX/pjsip/include"',
                      'LIBRARY_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/ButterflyMX/pjsip/lib"',
                      'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/ButterflyMX"',
                      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) PJ_AUTOCONF=1'
                      }

  s.ios.vendored_frameworks = 'ButterflyMXSDK.framework'

  s.dependency 'Alamofire'
end