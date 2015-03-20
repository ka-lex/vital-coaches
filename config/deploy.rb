# -*- encoding : utf-8 -*-
require 'bundler/capistrano'
require 'capistrano-unicorn'
set :rvm_ruby_string, :local
set :rvm_autolibs_flag, "read-only"       # more info: rvm help autolibs

before 'deploy:setup', 'rvm:install_rvm'  # install RVM
before 'deploy:setup', 'rvm:install_ruby' # install Ruby and create gemset, OR:
before 'deploy:setup', 'rvm:create_gemset' # only create gemset

set :rvm_require_role, :app
require "rvm/capistrano"

set :application, "vital-coaches"
set :repository,  "deploy@91.250.112.216:git/vital-coaches.git"
set :domain, '91.250.112.216'

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names

set :deploy_to, "/home/deploy/apps/#{application}"

set :ssh_options, { :forward_agent => true, :paranoid => false }

set :user, 'deploy'
set :group, 'staff'
set :use_sudo, false

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                         # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

default_run_options[:shell] = 'bash'

require 'capistrano-unicorn'
after 'deploy:restart', 'unicorn:reload' # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'  # app preloaded

# move config from shared to current
task :update_config, :roles => [:app] do
 run "cp #{shared_path}/config/* #{release_path}/config/" 
end

before "deploy:assets:precompile", :update_config
