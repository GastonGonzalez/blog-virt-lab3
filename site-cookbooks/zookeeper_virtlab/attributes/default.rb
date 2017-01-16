# Use Oracle JDK 8
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['oracle']['accept_oracle_download_terms'] = true

# Use latest stable release of ZooKeeper as of 16 January 2017.
default['zookeeper-cluster']['service']['version'] = '3.4.9'
# Note: https://supermarket.chef.io/cookbooks/libartifact requires a SHA-256 hash.
# Run shasum -a 256 zookeeper-3.4.9.tar.gz to determin the correct checksum.
default['zookeeper-cluster']['service']['binary_checksum'] = 'e7f340412a61c7934b5143faef8d13529b29242ebfba2eba48169f4a8392f535'


# Override default log configuration
default['zookeeper-cluster']['log4j']['properties']['zookeeper.root.logger'] = 'INFO, ROLLINGFILE'
default['zookeeper-cluster']['log4j']['properties']['zookeeper.log.dir'] = '/var/log/zookeeper'
default['zookeeper-cluster']['log4j']['properties']['zookeeper.tracelog.dir'] = '/var/log/zookeeper'
