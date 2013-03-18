Description
--------------

A nice LWRP to create a git wrapper and ssh_key file for use with the deploy resources ssh_wrapper attribute.

Requirements
--------------
- You must specify git_ssh_wrapper as a dependency in your metadata.rb file.
- You must have git installed

Attributes
--------------

* name: The name attribute, to prepended to the ssh key and the wrapper
* owner: to specify the owner of the generated files
* group: to specify the group of the generated files
* ssh_key_dir: the directory that the ssh key will be placed in, default => ~/.ssh
* ssh_wrapper_dir: the directory that the wrapper will be placed in, default => ~/
* ssh_key_data: the private ssh key

Usage
--------------

```ruby
git_ssh_wrapper "my_app" do
  owner 'my_user'
  group 'my_group'
  ssh_key_data data_bag['deploy_key']
end
```
