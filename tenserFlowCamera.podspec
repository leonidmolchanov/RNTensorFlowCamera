require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))
version = package['version']

Pod::Spec.new do |s|
  s.name           = 'TFImageClassification'
  s.version      = version
   s.summary      = "A native TFImageClassification react native component."

   s.description  = "A native TFImageClassification react native component."

   s.homepage     = "https://gitlab.audienzz.ch/audienzz/appnexus-app-lib.git"
   s.license      = "COMMERCIAL"
   s.author       = { "Leonid Molchanov" => "leonidmolchanov1987@gmail.com" }
   s.source_files   = 'ios/*.{h,m,swift,tflite,txt}'
  s.source         = { :git => 'https://github.com/react-native-community/react-native-camera', :tag => "v#{s.version}" }

  s.requires_arc   = true
  s.platform       = :ios, '10.0'


 # Pods for ImageClassification



  s.preserve_paths = 'LICENSE', 'README.md', 'package.json', 'index.js'

  s.dependency 'React-Core'
  s.dependency "TensorFlowLiteSwift"
end
