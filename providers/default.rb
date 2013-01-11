#
# Cookbook Name:: git_ssh_wrapper
# Provider:: default
#
# Copyright 2012, Travis Staton
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

action :create do
  
  directory new_resource.ssh_key_dir do
    owner new_resource.owner
    group new_resource.group
    mode 0640
    recursive true
    not_if { test "R", new_resource.ssh_key_dir }
  end

  directory new_resource.ssh_wrapper_dir do
    owner new_resource.owner
    group new_resource.group
    mode 0750
    recursive true
    not_if { test "R", new_resource.ssh_wrapper_dir }
  end

  template "#{new_resource.ssh_key_dir}/#{new_resource.name}_deploy_key" do
    cookbook 'git_ssh_wrapper'
    source "deploy_key.erb"
    owner new_resource.owner
    group new_resource.group
    mode 0600
    variables({ :ssh_key_data => new_resource.ssh_key_data })
  end

  template "#{new_resource.ssh_wrapper_dir}/#{new_resource.name}_deploy_wrapper.sh" do
    cookbook 'git_ssh_wrapper'
    source "git_ssh_wrapper.erb"
    owner new_resource.owner
    group new_resource.group
    mode 0700
    variables({
          :ssh_key_dir => new_resource.ssh_key_dir,
          :name => new_resource.name
      })
    new_resource.updated_by_last_action(true)
  end
end

