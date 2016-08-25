#
# Author:: Philippe EYCHART (<peychart@mail.pf>)
# Cookbook Name:: chef-proxypacfile
# Resource:: default
#
# Copyright 2015-2017, Philippe EYCHART
#
# Licensed under the GNU License, Version 3;
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.gnu.org/licenses/gpl-3.0.html
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# LXC install:
%w( apache2 libapache2-mod-php5 ).each do |package|
  package package do
    action :install
  end
end

service 'apache2' do
  action [:enable, :start]
end

# set Apache Document Root:
bash "change-doc-root" do
  code "dir=$(sed -e 's/#.*$//' /etc/apache2/sites-enabled/000-default.conf| grep DocumentRoot| cut -d' ' -f2); [ -d $dir -a ! -L $dir ] && mv $dir $dir.sv; ln -fs #{node['chef-proxypacfile']['docRoot']} $dir"
end

## Apache conf:
bash "change-doc-root" do
  code "cd /etc/apache2/sites-enabled/ && grep -qs ServerAlias 000-default.conf || (sed -e '/DocumentRoot/i\\        ServerAlias #{node['chef-proxypacfile']['serverAlias']}' 000-default.conf >/tmp/000-default.conf && cat /tmp/000-default.conf >000-default.conf)"
  notifies :restart, 'service[apache2]', :immediately
end

# create the pac file:
file "#{node['chef-proxypacfile']['docRoot']}/#{node['chef-proxypacfile']['fileName']}" do
#  content definition
  mode '0644'
end

