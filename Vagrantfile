# -*- mode: ruby -*-
# vi: set ft=ruby :

hostname = ENV['HOSTNAME'] ? ENV['HOSTNAME'] : 'st2-package-builder'
private_ip = ENV['PRIVATE_IP'] ? ENV['PRIVATE_IP'] : '172.168.50.12'
source_folder = ENV['SRC_FOLDER'] || nil
dest_folder = ENV['DST_FOLDER'] || nil


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.network "private_network", ip: "172.168.50.12"
    config.vm.hostname = "#{hostname}"

    config.vm.box = 'phusion/ubuntu-14.04-amd64'

    config.vm.provider :virtualbox do |vb|
      vb.name = "#{hostname}"
    end

    if !source_folder.nil? and !dest_folder.nil?
      config.vm.synced_folder "#{source_folder}", "#{dest_folder}", type: "nfs"
    end

    config.vm.provision :shell, :path => "scripts/bootstrap.sh"
end
