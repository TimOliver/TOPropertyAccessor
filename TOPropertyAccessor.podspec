Pod::Spec.new do |s|
  s.name     = 'TOPropertyAccessor'
  s.version  = '1.1.0'
  s.license  =  { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'An abstract class that enables hooking the properties of subclasses.'
  s.homepage = 'https://github.com/TimOliver/TOPropertyAccessor'
  s.author   = 'Tim Oliver'
  s.source   = { :git => 'https://github.com/TimOliver/TOPropertyAccessor.git', :tag => s.version }
  s.source_files = 'TOPropertyAccessor/**/*.{h,m}'
  s.requires_arc = true

  s.ios.deployment_target   = '9.0'
  s.osx.deployment_target   = '10.9'
  s.tvos.deployment_target = '9.0'

end
