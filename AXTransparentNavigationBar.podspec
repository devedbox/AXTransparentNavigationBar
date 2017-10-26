Pod::Spec.new do |s|

  s.name         = 'AXTransparentNavigationBar'
  s.version      = '1.0.0'
  s.summary      = 'A transparent navigation bar tool kit.'
  s.description  = <<-DESC
                    A transparent navigation bar tool kit using on iOS platform.
                   DESC

  s.homepage     = 'https://github.com/devedbox/AXTransparentNavigationBar'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { 'aiXing' => '862099730@qq.com' }
  s.platform     = :ios, '7.0'

  s.source       = { :git => 'https://github.com/devedbox/AXTransparentNavigationBar.git', :tag => s.version }
  s.source_files  = 'AXTransparentNavigationBar/Classes/*.{h,m}'

  s.frameworks = 'UIKit', 'Foundation'

  s.requires_arc = true
end
