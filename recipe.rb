# coding: utf-8
package 'http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm' do
  not_if 'rpm -q nginx-release-centos-6-0.el6.ngx.noarch'
end

%w(git epel-release nginx gcc gcc-c++ openssl-devel readline-devel curl-devel expat-devel gettext-devel perl-devel zlib-devel).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'install git' do
  cwd '/usr/local/src/'
  command <<-"EOS"
    git clone git://git.kernel.org/pub/scm/git/git.git
    cd git
    make prefix=/usr/local all
    make prefix=/usr/local install
  EOS
end

service "nginx" do
  action [:enable, :start]
end
