require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RNCPickerComp"
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platforms    = { :ios => "9.0", :osx => "10.14" }

  s.source       = { :git => "https://github.com/ehtisham-ali-emumba/renamesRNCPicker.git", :tag => "v#{s.version}" }
  s.ios.source_files  = "ios/**/*.{h,m}"
  s.osx.source_files  = "macos/**/*.{h,m}"

  
  s.dependency 'React-Core'
end
