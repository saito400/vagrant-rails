# coding: utf-8
package 'http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm' do
  not_if 'rpm -q nginx-release-centos-6-0.el6.ngx.noarch'
end

%w(epel-release nginx).each do |pkg|
  package pkg do
    action :install
  end
end

service "nginx" do
  action [:enable, :start]
end
