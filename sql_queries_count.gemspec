$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sql_queries_count/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sql_queries_count"
  s.version     = SqlQueriesCount::VERSION
  s.authors     = ["Kacper Cieśla (comboy)"]
  s.email       = ["kacper.ciesla@gmail.com  "]
  s.homepage    = "https://github.com/comboy"
  s.summary     = "Adds info about number of sql queries done during request to your rails logs."
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 3.0.0"

  s.add_development_dependency "sqlite3"
end
