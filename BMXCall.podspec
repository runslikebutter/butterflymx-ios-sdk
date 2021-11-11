Pod::Spec.new do |s|
  s.name = 'BMXCall'
  s.version = '2.0.0'
  s.swift_version = '5.3'
  s.source = { :http => 'https://github.com/runslikebutter/butterflymx-ios-sdk/raw/'+s.name+'_'+s.version.to_s+'/BMXCall.zip' }


  s.summary = 'A Swift framework to implement ButterflyMX SDK'
  s.homepage = 'https://github.com/runslikebutter/butterflymx-ios-sdk'
  s.author = {'butterflymx' => 'admin@butterflymx.com'}
  s.license = { :type => 'Apache-2.0', :file => 'LICENSE' }

  s.platform = :ios

  s.ios.deployment_target = '10.0'

  s.ios.preserve_path = 'pjsip/include/module.modulemap'
  s.ios.preserve_paths = 'pjsip/**/*'
  s.ios.xcconfig = {  'SWIFT_INCLUDE_PATHS' => '$(inherited) "${PODS_ROOT}/'+s.name+'/pjsip/include"',
                      'OTHER_LDFLAGS' => '$(inherited) -l"c++"',
                      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) PJ_AUTOCONF=1'
                    }

  s.vendored_frameworks = 'BMXCall.xcframework'

  s.dependency 'BMXCore', '~> 2.0.0'
end