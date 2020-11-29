# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/challenges/version"

Gem::Specification.new do |s|
  s.version = Decidim::Challenges.version
  s.authors = ["Oliver Valls"]
  s.email = ["199462+tramuntanal@users.noreply.github.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim-module-challenges"
  s.required_ruby_version = ">= 2.6"

  s.name = "decidim-challenges"
  s.summary = "A decidim challenges module"
  s.description = "Articulates the collective action of diverse actors in order to address shared challenges and the problems that derive from them across the territory."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  CHALLENGES_DECIDIM_VER = "~> 0.22.0"
  s.add_dependency "decidim-core", CHALLENGES_DECIDIM_VER

  s.add_development_dependency "decidim", CHALLENGES_DECIDIM_VER
  s.add_development_dependency "decidim-dev", CHALLENGES_DECIDIM_VER
end
