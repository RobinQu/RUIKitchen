Pod::Spec.new do |s|
  s.name         = "RUIKitchen"
  s.version      = "0.0.3"
  s.summary      = "Some drop-in view controllers."
  s.homepage     = "https://github.com/RobinQu/RUIKitchen"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "RobinQu" => "robinqu@gmail.com" }
  s.source       = { :git => "https://github.com/RobinQu/RUIKitchen.git", :tag => "#{s.version}" }
  s.platform     = :ios, '5.0'
  s.source_files = 'Classes', 'Classes/**/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'
  s.requires_arc = true
end
