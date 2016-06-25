# coding: utf-8

%w(epel-release nginx emacs).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'install' do

  command <<-"EOS"
    wget https://dl.eff.org/certbot-auto

    chmod a+x certbot-auto

  EOS
end

service "nginx" do
  action [:enable, :start]
end

