Pod::Spec.new do |s|
  s.name         = "SPCarouselView"
  s.version      = "1.0.0"
  s.summary      = "A terrible UI Component."
  s.homepage     = "https://github.com/kevinj04/CarouselView.git"
  s.license      = { :type => 'WTFPL', :file => 'LICENSE' }
  s.author       = { "Kevin Jenkins" => "kevinj04@gmail.com" }
  s.source       = { :git => "https://github.com/kevinj04/CarouselView.git", :tag => "1.0.0" }
  s.platform     = :ios, '5.0'
  s.source_files = 'CarouselView/CarouselView/carousel/SPCarouselView.{h,m}'
  s.requires_arc = true
end