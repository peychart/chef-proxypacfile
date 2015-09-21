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

default['chef-proxypacfile']['docRoot'] = '/var/www/html/'
default['chef-proxypacfile']['serverName'] = 'proxy.' + node['domain']
default['chef-proxypacfile']['fileName'] = 'proxy.pac'
default['chef-proxypacfile']['fileDefinition'] = [
  'function FindProxyForURL(url, host)',
  '{',
  '    if ( shExpMatch(url, "*.gov.pf") || shExpMatch(url, "*.gov.pf/*") ) {',
  '        return "DIRECT";',
  '    }',
  '',
  '    if ( isInNet(myIpAddress(), "10.0.0.0", "255.0.0.0")',
  '        || isInNet(myIpAddress(), "172.16.0.0", "255.240.0.0")',
  '        || isInNet(myIpAddress(), "192.168.0.0", "255.255.0.0")',
  '    )',
  '        return "PROXY squid.toriki.srv.gov.pf:3128";',
  '    else',
  '        return "DIRECT";',
  '}'
]
