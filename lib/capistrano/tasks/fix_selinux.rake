namespace :deploy do
  desc "Update permissions for SELinux"
  task :fix_selinux do
    on roles(:web) do
      execute "chcon -R -t httpd_sys_content_t #{current_path}"
      execute "chcon -R -t httpd_sys_content_t #{shared_path}"
    end
  end
end
