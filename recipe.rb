# coding: utf-8

%w(git epel-release nginx gcc gcc-c++ openssl-devel readline-devel curl-devel expat-devel gettext-devel perl-devel zlib-devel mysql-devel emacs).each do |pkg|
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
    cd ../
    curl --silent --location https://rpm.nodesource.com/setup_4.x | sudo bash -
    yum install -y nodejs

  EOS
end

service "nginx" do
  action [:enable, :start]
end

user "create user" do
  username "ec2-user"
end

execute "mkdir /var/www" do
  not_if "test -d /var/www"
end

execute "chown /var/www" do
  command "chown ec2-user /var/www"
  user "root"
end
