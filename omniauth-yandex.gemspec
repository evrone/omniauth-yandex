$:.push File.expand_path("../lib", __FILE__)
require "omniauth-yandex/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-yandex"
  s.version     = Omniauth::Yandex::VERSION
  s.authors     = ["Kir Shatrov"]
  s.email       = ["shatrov@me.com"]
  s.homepage    = "https://github.com/evrone/omniauth-yandex"
  s.summary     = %q{OmniAuth strategy for Yandex.ru}
  s.description = %q{OmniAuth strategy for Yandex.ru}

  s.rubyforge_project = "omniauth-yandex"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'omniauth', '~> 1.0'
  s.add_dependency 'omniauth-oauth2', '~> 1.0'
end
