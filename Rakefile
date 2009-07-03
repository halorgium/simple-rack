require 'rubygems'
require 'rake'

require 'lib/simple_rack'

@lib_module = SimpleRack

@lib_module.activate
@spec = Gem::Specification.new do |s|
  s.name = @lib_module.application
  s.version = @lib_module::VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = false
  s.summary = "Something"
  s.description = s.summary
  s.authors = ["Someone"]
  s.email = "test@example.org"
  s.homepage = "http://example.org/"

  @lib_module.dependencies.each do |name,version|
    s.add_dependency name, version
  end

  s.require_path = 'lib'
  s.files = %w(Rakefile) + Dir.glob("lib/**/*.{rb,haml}")
end

require 'rake/gempackagetask'
Rake::GemPackageTask.new(@spec) do |pkg|
  pkg.gem_spec = @spec
end
