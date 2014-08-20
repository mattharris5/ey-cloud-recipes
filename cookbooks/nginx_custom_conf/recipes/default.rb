if ['app_master', 'app', 'util', 'solo'].include?(node[:instance_role])
  node[:applications].each do |app, data|
    remote_file "/etc/nginx/servers/#{app}/custom.conf" do 
      owner node[:owner_name]
      group node[:owner_name]
      mode 0755 
      source "nginx.custom_conf" 
      backup true 
    end 
  end
end