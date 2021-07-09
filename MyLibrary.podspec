Pod::Spec.new do |spec|

  spec.name         = "MyLibrary"
  spec.version      = "0.0.1"
  spec.summary      = "Best Library"
  spec.homepage     = "https://github.com/batterfly173/CustomPod"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Evgeny" => "evgenyf021@gmail.com" }
  spec.platform     = :ios, "7.0"
  spec.source       = { :git => "https://github.com/batterfly173/CustomPod.git", :tag => spec.version.to_s }
  spec.source_files  = "ToDoItem.{swift}"

end
