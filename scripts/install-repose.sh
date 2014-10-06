#!/usr/bin/env bash

function makes_nginx_dir_writeable() {
  sudo chmod -R 777 /usr/share/nginx/html
}

function configure_repositories() {
  sudo apt-get install -yq wget curl
  wget -O - http://repo.openrepose.org/debian/pubkey.gpg | sudo apt-key add -
  sudo sh -c 'echo "deb http://repo.openrepose.org/debian stable main" > /etc/apt/sources.list.d/openrepose.list'
  sudo apt-get update # && sudo apt-get upgrade -yq
}

function install_repose() {
  sudo apt-get install -y repose-valve repose-filter-bundle repose-extensions-filter-bundle
  sudo service repose-valve start
}

function install_nginx() {
  sudo apt-get install nginx -yq
  sudo service nginx start
}

configure_repositories
install_repose
install_nginx
makes_nginx_dir_writeable