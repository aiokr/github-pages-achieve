# coding: utf-8
Gem::Specification.new do |s|
  s.name          = "jekyll-theme-wapiti"
  s.version       = "0.1.5"
  s.authors       = ["AngusChen"]
  s.email         = ["hiaiokr@gmail.com"]

  s.summary       = "Jekyll-theme-wapiti"
  s.description   = "a better theme for jekyll"
  s.homepage      = "https://github.com/aiokr/jekyll-theme-wapiti"
  s.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
    #spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  #else
    #raise "RubyGems 2.0 or newer is required to protect against " \
      #"public gem pushes."
  #end

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  s.add_runtime_dependency "jekyll", "~> 3.4"
  s.add_development_dependency "bundler", "~> 1.14"
  s.add_development_dependency "rake", "~> 10.0"
end
