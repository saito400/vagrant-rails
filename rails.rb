# coding: utf-8

execute 'install npm' do
  cwd '/usr/local/src/'
  command <<-"EOS"
    curl --silent --location https://rpm.nodesource.com/setup_4.x | sudo bash -
    yum install -y nodejs
  EOS
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

