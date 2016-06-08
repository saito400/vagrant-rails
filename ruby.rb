# coding: utf-8

include_recipe "rbenv::system"

remote_file ".bashrc" do
  source './files/.bashrc'
end

