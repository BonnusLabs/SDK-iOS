
Pod::Spec.new do |s|
  s.name             = 'SDK-iOS'
  s.version          = '1.0'
  s.summary          = 'Bonnus SDK for iOS.'
 
  s.description      = <<-DESC
This pod contains the lastest version of Bonnus SDK
                        DESC
 
  s.homepage         = 'https://github.com/BonnusLabs/SDK-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Bonnus' => 'manuel@bonnus.me' }
  s.source           = { :git => 'https://github.com/BonnusLabs/SDK-iOS.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '11.4'
  s.swift_version = '4.2'
  s.source_files = 'Testing/*'
 
end