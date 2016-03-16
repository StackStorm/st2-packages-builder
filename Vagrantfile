# -*- mode: ruby -*-
# vi: set ft=ruby :

hostname = ENV['HOSTNAME'] ? ENV['HOSTNAME'] : 'st2-package-builder'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.network "public_network"
    config.vm.hostname = "#{hostname}"

    config.vm.box = 'phusion/ubuntu-14.04-amd64'

    config.vm.provider :virtualbox do |vb|
      vb.name = "#{hostname}"
    end

    config.vm.provision :shell, :path => "scripts/bootstrap.sh"
end
