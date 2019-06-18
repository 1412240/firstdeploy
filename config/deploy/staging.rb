# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}
set :stage, :staging
set :branch, 'master'
set :rbenv_ruby, '2.6.3'

set :rails_env, :staging
set :environment, "staging"
# whether we're using ssl or not, used for building nginx
# config file
set :enable_ssl, false



server '13.228.73.225', user: 'ubuntu', roles: %w{app db web}
