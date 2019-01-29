set :stage, :staging

set :deploy_to, '/home/rVisor/Sites/researcher'

role :app, %w(detemiro.org)
role :web, %w(detemiro.org)
role :db, %w(detemiro.org)

set :ssh_options, :port => 2215

server 'detemiro.org',
  :user => 'rVisor',
  :roles => %w(app db web)

before 'passenger:restart', 'deploy:fix_permissions'
