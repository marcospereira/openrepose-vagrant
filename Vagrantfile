# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.box = "repose"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network :forwarded_port, guest: 80, host: 8880
  config.vm.network :forwarded_port, guest: 8080, host: 8881

  config.vm.provision "shell", path: "scripts/install-repose.sh"

  config.vm.provision "file", source: "data/people.json", destination: "/usr/share/nginx/html/people.json"

  config.vm.provision "file", source: "etc/repose/client-auth-n.cfg.xml", destination: "/etc/repose/client-auth-n.cfg.xml"
  config.vm.provision "file", source: "etc/repose/rate-limiting.cfg.xml", destination: "/etc/repose/rate-limiting.cfg.xml"
  config.vm.provision "file", source: "etc/repose/system-model.cfg.xml", destination: "/etc/repose/system-model.cfg.xml"

end