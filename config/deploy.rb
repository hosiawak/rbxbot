#require 'mongrel_cluster/recipes'

set :application, "tryruby"
#set :repository,  "http://tools.assembla.com/svn/scruby/trunk"

# GIT settings
default_run_options[:pty] = true

set :repository, "https://github.com/hosiawak/TryRuby.git"
set :scm, :git
set :user, "hosiawak"
set :remote, "master"
  # If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/karol/sites/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
#set :scm, :subversion
#set :scm_username, 'hosiawak'
#set :scm_password, 'etheogen'
set :use_sudo, false

# Deploy via remote-cache
#set :deploy_via, :checkout
set :deploy_via, :remote_cache

role :app, "karol@h1.hogo.pl"
role :web, "karol@h1.hogo.pl"
role :db,  "karol@h1.hogo.pl", :primary => true


# hooks
after "deploy", "deploy:cleanup"
