namespace :deploy do
  desc "Update permissions"
  task :fix_permissions do
    on roles(:web) do
      execute "chown -R #{host.user}:#{host.user} #{current_path}"
      execute "chmod -R 777 #{current_path}"
      execute "chmod -R 777 #{shared_path}"
    end
  end
end
