Gem::Specification.new do |gem|
    gem.name          = "shrine-bunny-stream"
    gem.version       = "0.1.0"
  
    gem.required_ruby_version = ">= 2.1"
  
    gem.summary      = "Provides BunnyStream storage for Shrine."
    gem.homepage     = "https://github.com/OutdoorMap/shrine-bunny-stream"
    gem.authors      = ["Joakim Nylén"]
    gem.email        = ["rubygems@joakim.nylen.nu"]
    gem.license      = "MIT"
  
    gem.files        = Dir["README.md", "LICENSE.txt", "lib/**/*.rb", "*.gemspec"]
    gem.require_path = "lib"
  
    gem.add_dependency "shrine", ">= 3.0.0.rc", "< 4"
    gem.add_dependency "bunny_stream", ">= 0.1.0"
    # gem.add_dependency "down", "~> 5.0"
    gem.add_dependency "http", ">= 3.2", "< 6"
  
    gem.add_development_dependency "rake"
    gem.add_development_dependency "minitest"
    gem.add_development_dependency "dotenv"
  end
