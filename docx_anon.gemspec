
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "docx_anon/version"

Gem::Specification.new do |spec|
  spec.name          = "docx_anon"
  spec.version       = DocxAnon::VERSION
  spec.authors       = ['Scholastica']
  spec.email         = ["tatum@ashlandstudios.com"]
  spec.summary       = "Anonymize a docx file by removing identifiable information"


  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "nokogiri", "< 2"
  spec.add_dependency "rubyzip",  "~>2.3.0"

  spec.add_development_dependency "exiftool", "< 2"
  spec.add_development_dependency "bundler", ">= 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "< 4"
  spec.add_development_dependency "pry", "~> 0.9"
end
