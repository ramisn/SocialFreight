namespace :nginx do

  desc "Install latest stable version of nginx"
  task :install, roles: :web do
    add_apt_repository("ppa:nginx/stable")
  	#run "#{sudo} add-apt-repository ppa:nginx/stable"
  	run "#{sudo} apt-get -y update"
  	run "#{sudo} apt-get -y install nginx"
  end
  after "deploy:install", "nginx:install"

  desc "Setup nginx configuration for this application"
	task :setup, roles: :web do
    template "nginx_unicorn.erb", "/tmp/nginx_conf"
    run "#{sudo} mv /tmp/nginx_conf /etc/nginx/sites-enabled/#{application}"
    run "#{sudo} rm -f /etc/nginx/sites-enabled/default"
    restart
	end
	after "deploy:setup", "nginx:setup"

	%w[start stop restart].each do |command|
		desc "#{command}ing nginx for #{application}"
		task command, roles: :web do
			run "#{sudo} service nginx #{command}"
		end
	end

end