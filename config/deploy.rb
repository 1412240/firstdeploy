# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "myapp"
set :repo_url, "https://github.com/1412240/firstdeploy"
set :deploy_to, "/home/ubuntu/www/myapp"

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails puma pumactl}
set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }


set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :keep_releases, 5


# Default value for :linked_files is []
set :linked_files, %w[config/database.yml config/secrets.yml]
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

namespace :deploy do
  desc 'restart application'
  task :restart do
    on roles(:app) do
      invoke 'puma:stop'
      invoke 'puma:start'
    end
  end
end

