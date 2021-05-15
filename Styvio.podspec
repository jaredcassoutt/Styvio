
Pod::Spec.new do |spec|

  spec.name         = "Styvio"
  spec.version      = "0.0.1"
  spec.summary      = "This serves as a JSON decoder for the Styvio stock API. It provides information to create everything featured on the Styvio app."

  spec.description  = <<-DESC
    This serves as a JSON decoder for the Styvio stock API. It provides the necessary information to create each and every feature that is shown on the Styvio mobile app
                   DESC

  spec.homepage     = "https://github.com/jaredcassoutt/styvio"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Jared Cassoutt" => "jaredcass99@gmail.com" }

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "5.0"

  spec.source        = { :git => "https://github.com/jaredcassoutt/styvio.git", :tag => "#{spec.version}" }
  spec.source_files  = "Styvio/**/*.{h,m,swift}"

end
