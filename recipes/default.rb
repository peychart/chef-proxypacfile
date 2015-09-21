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

web_app node['chef-proxypacfile']['serverName'] do
  cookbook 'apache2'
  server_name node['chef-proxypacfile']['serverName']
  server_aliases node['chef-proxypacfile']['serverAlias'] if node['chef-proxypacfile']['serverAlias']
  docroot node['chef-proxypacfile']['docRoot']
  enable true
end

definition=''
Array( node['chef-proxypacfile']['fileDefinition'] ).each do |i|
  definition = definition + i + "\n"
end

file "#{node['chef-proxypacfile']['docRoot']}/#{node['chef-proxypacfile']['fileName']}" do
  content definition
  mode '0644'
end
