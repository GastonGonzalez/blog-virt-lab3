#
# Cookbook Name:: zookeeper_virtlab
# Recipe:: default
#
# Copyright 2017 Gaston Gonzalez
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

# Install and configure ZooKeeper
include_recipe 'zookeeper::default'

# Determine ID for current node in cluster
execute 'set_cluster_node_id' do
  command 'grep $(hostname) /opt/zookeeper/conf/zoo.cfg | sed -r \'s/server.([0-9]+)=.*/\1/g\' > /var/lib/zookeeper/myid'
end

file '/var/lib/zookeeper/myid' do
  mode '0644'
  owner node['zookeeper']['user']
  group node['zookeeper']['user']
end

# Start ZooKeeper
include_recipe 'zookeeper::service'
