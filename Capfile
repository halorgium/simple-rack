role :app, "174.143.245.125"

set :user, "deploy"

require File.dirname(__FILE__) + "/lib/#{application}"
set :lib_module, SimpleRack

set :application, lib_module.application
set :current_release, "/var/www/#{application}/current"
set :current_version, lib_module::VERSION

task :deploy do
  unless system("rake gem")
    raise "Could not build gem"
  end
  run "if [ ! -d ${HOME}/.gem/ruby ]; then mkdir -p ${HOME}/.gem/ruby; fi"
  run "chmod 0000 ${HOME}/.gem/ruby"

  sudo "sh -c 'if gem spec #{application} name; then gem uninstall -a #{application}; fi'"

  run "mkdir -p #{current_release}/tmp"
  run "mkdir -p #{current_release}/public"
  gem_file = "#{application}-#{current_version}.gem"
  put File.read("pkg/#{gem_file}"), "#{current_release}/#{gem_file}"
  sudo "gem install #{current_release}/#{gem_file}"
  rackup = <<-EOT
gem '#{application}', '=#{current_version}'
require '#{application}'

run #{lib_module}.app
  EOT
  put rackup, "#{current_release}/config.ru"
  run "touch #{current_release}/tmp/restart.txt"
end

# vim:ft=ruby
