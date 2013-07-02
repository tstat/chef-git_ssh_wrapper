#
# Cookbook Name:: git_ssh_wrapper
# Resource:: default
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

actions :create
default_action :create

attribute :name, :kind_of => String, :name_attribute => true
attribute :owner, :kind_of => String, :required => true
attribute :group, :kind_of => String, :required => true
attribute :ssh_key_dir, :kind_of => String
attribute :ssh_wrapper_dir, :kind_of => String
attribute :ssh_key_data, :kind_of => String, :required => true


def initialize(*args)
  super
  @action = :create

  @run_context.include_recipe "git"
end
