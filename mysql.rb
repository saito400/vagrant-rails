# coding: utf-8


package 'http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm' do
  not_if 'rpm -q mysql-community-release-el7-5.noarch'
end

%w(mysql-community-server).each do |pkg|
  package pkg do
    action :install
  end
end

service "mysqld" do
  action [:enable, :start]
end
