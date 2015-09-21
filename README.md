proxypacfile Cookbook
=====================

Configures a http server to deploy a proxy.pac file.


Recipes
-------
### default attributes

See: https://github.com/peychart/chef-proxypacfile/blob/master/attributes/default.rb

All default attributes can be modified.


Example of role definition
--------------------------

```json
{
 "override_attributes": {
  },
  "run_list": [
    "recipe[chef-proxypacfile]"
  ]
}
```

License & Authors
-----------------

- Author:: Philippe Eychart (peychart@mail.pf)

```text
Licensed under the GNU License, Version 3;
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.gnu.org/licenses/gpl-3.0.html

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
