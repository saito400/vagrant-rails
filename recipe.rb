# coding: utf-8

%w(git epel-release nginx gcc gcc-c++ openssl-devel readline-devel curl-devel expat-devel gettext-devel perl-devel zlib-devel mysql-devel).each do |pkg|
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
