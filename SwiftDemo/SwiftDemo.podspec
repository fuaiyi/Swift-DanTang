Pod::Spec.new do |s|
  s.name         = 'SwiftDemo'
  s.version      = '<#Project Version#>'
  s.license      = '<#License#>'
  s.homepage     = '<#Homepage URL#>'
  s.authors      = '<#Author Name#>': '<#Author Email#>'
  s.summary      = '<#Summary (Up to 140 characters#>'

  s.platform     =  :ios, '<#iOS Platform#>'
  s.source       =  git: '<#Github Repo URL#>', :tag => s.version
  s.source_files = '<#Resources#>'
  s.frameworks   =  '<#Required Frameworks#>'
  s.requires_arc = true
  
# Pod Dependencies
  s.dependencies =	pod 'SnapKit', '~> 0.22.0'
  s.dependencies =	pod 'Kingfisher', '~> 2.4.3'
  s.dependencies =	pod 'SVProgressHUD', '~> 2.0.3'
  s.dependencies =	pod 'FDFullscreenPopGesture', '~> 1.1'
  s.dependencies =	pod 'Alamofire', '~> 3.4.1'
  s.dependencies =	pod 'SwiftyJSON', '~> 2.3.2'
  s.dependencies =	pod 'QorumLogs', '~> 0.8'

end