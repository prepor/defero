set :user, "root"
set :password, 'B9AKGT8zJt'

set :use_sudo, false

set :deploy_via, :remote_cache

set :application, "defero"
set :repository,  "git@github.com:preprocessor/defero.git"
set :scm, :git

set :branch, "test"
set :deploy_to, "/home/#{application}"


# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "72.14.181.160"
role :web, "72.14.181.160"
role :db,  "72.14.181.160", :primary => true


# namespace :deploy do
#   desc "Restart Application"
#   task :restart do
#     run "touch #{current_path}/tmp/restart.txt"
#   end
# end


# after :deploy, "passenger:restart"

# 
# desc "copy the database.yml file over"
# task :copy_prod_db_file do 
#   run "cp -f #{release_path}/config/database.yml.server #{release_path}/config/database.yml"
# end
# 
# after 'deploy:update_code', :copy_prod_db_file