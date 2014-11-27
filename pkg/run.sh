puppet module uninstall greg-nginx
puppet module build 
puppet module install greg-nginx-0.1.0.tar.gz 
puppet apply /etc/puppet/manifests/site.pp 
