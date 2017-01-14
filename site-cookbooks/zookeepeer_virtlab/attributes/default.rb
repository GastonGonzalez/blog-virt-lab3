default['zookeeper']['config'] = {
  'clientPort' => 2181,
  'dataDir'    => '/var/lib/zookeeper',
  'tickTime'   => 2000,
  'initLimit'  => 5,
  'syncLimit'  => 2,
  'server.1'   => 'zk1.localdomain:2888:3888',
  'server.2'   => 'zk2.localdomain:2888:3888',
  'server.3'   => 'zk3.localdomain:2888:3888'
}

# Use Oracle JDK 8
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['oracle']['accept_oracle_download_terms'] = true
