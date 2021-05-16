Pod::Spec.new do |spec|

  spec.name         = "Styvio"
  spec.version      = "0.0.2"
  spec.summary      = "This is a Swift package that can be used to retrieve stock data from the Styvio API."

  spec.description  = <<-DESC
    This is an Swift package that can be used to retrieve stock data from the Styvio API. It includes many valuable end points including information for charting, sentiment, buy/sell ratings, and much more. This package is very easy to import and implement!
                   DESC

  spec.homepage     = "https://github.com/jaredcassoutt/Styvio"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Jared Cassoutt" => "jaredcass99@gmail.com" }

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "5.0"

  spec.source        = { :git => "https://github.com/JaredCassoutt/Styvio.git", :tag => "#{spec.version}" }
  spec.source_files  = "Styvio/**/*.{h,m,swift}"

end
