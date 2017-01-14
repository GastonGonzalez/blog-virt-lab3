# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

    config.ssh.private_key_path = '/Users/gaston/vagrant-keys/vagrant'

    config.vm.provider :proxmox do |proxmox|
        proxmox.endpoint = 'https://192.168.5.110:8006/api2/json'
        proxmox.user_name = 'vagrant@pve'
        proxmox.password = 'vagrant'
        proxmox.vm_id_range = 900..910
        proxmox.vm_name_prefix = 'vagrant_'
        proxmox.openvz_os_template = 'local:vztmpl/centos-7-base_20161225_amd64.tar.xz'
        proxmox.vm_type = :lxc
        proxmox.vm_storage = 'local-lvm'
        proxmox.vm_disk_size = '30G'
        proxmox.vm_memory = 1024
    end

    config.vm.define "zk1" do |zk1|
        zk1.vm.hostname = 'zk1'
        zk1.vm.box = 'dummy'
        zk1.vm.network :public_network, ip: '192.168.5.150', interface: 'eth0', bridge: 'vmbr0', gw: '192.168.5.1'

        zk1.vm.provider :proxmox do |proxmox|
            proxmox.vm_storage = 'local-lvm'
            proxmox.vm_disk_size = '40G'
            proxmox.vm_memory = 2048
        end
    end

    config.vm.define "zk2" do |zk2|
        zk2.vm.hostname = 'zk2'
        zk2.vm.box = 'dummy'
        zk2.vm.network :public_network, ip: '192.168.5.151', interface: 'eth0', bridge: 'vmbr0', gw: '192.168.5.1'

        zk2.vm.provider :proxmox do |proxmox|
            proxmox.vm_storage = 'local-lvm'
            proxmox.vm_disk_size = '40G'
            proxmox.vm_memory = 2048
        end
    end

    config.vm.define "zk3" do |zk3|
        zk3.vm.hostname = 'zk3'
        zk3.vm.box = 'dummy'
        zk3.vm.network :public_network, ip: '192.168.5.152', interface: 'eth0', bridge: 'vmbr0', gw: '192.168.5.1'

        zk3.vm.provider :proxmox do |proxmox|
            proxmox.vm_storage = 'local-lvm'
            proxmox.vm_disk_size = '40G'
            proxmox.vm_memory = 2048
        end
    end

    config.omnibus.chef_version = :latest

    # Enable the Berkshelf plugin.
    config.berkshelf.enabled = true

    config.vm.provision "chef_zero" do |chef|
        chef.cookbooks_path = [ 'site-cookbooks' ]
        chef.data_bags_path = "data_bags"
        chef.nodes_path = "nodes"
        chef.roles_path = "roles"

        # Add a recipe
        chef.add_recipe "zookeeper-virtlab::default"
    end

end
