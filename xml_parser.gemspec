# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xml_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "xml_parser"
  spec.version       = XmlParser::VERSION
  spec.authors       = ["Abdel Hakim Bensiali"]
  spec.email         = ["bensialih@gmail.com"]

  spec.summary       = %q{handle strings.xml files for android}
  spec.description   = %q{xml to csv and back to xml for translation purposes}
  spec.homepage      = "https://github.com/bensialih/xml_parser"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "https://github.com/bensialih/xml_parser"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

    spec.add_dependency "bundler", ">= 2.2.33"
  spec.add_development_dependency "bundler", ">= 2.2.33"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "coveralls"

end
