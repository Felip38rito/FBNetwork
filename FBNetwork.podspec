Pod::Spec.new do |spec|
  spec.name         = "FBNetwork"
  spec.version      = "0.0.1"
  spec.summary      = "A simple utility for the doing http calls"

  spec.description  = "Just a simple utility for the network layer, aiming to call a network request and parse it as models"

  spec.homepage     = "https://github.com/Felip38rito/FBNetwork"
  spec.license      = "MIT"
  spec.author             = { "Felipe Correia Brito" => "felipe.correia.wd@gmail.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/Felip38rito/FBNetwork.git", :tag => "#{spec.version}" }
  spec.source_files  = "FBNetwork", "FBNetwork/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"
end
