define nginx::vhost (
        $document_root  = "${nginx::rootdir}/$name",
        $template   = "nginx/vhost/nginx-vhost.erb",
        $servername   = "${name}",
        $serveraliases  = "",
        $port     = "80",
        $vhost_name  = "${name}"
)
{

include nginx

file { "${nginx::confdir}/${name}.conf":
        content => template("$template"),
        owner => "root",
        group => "root",
        mode  => "0644",
#        require => Package["nginx"],
#        notify  => Service["nginx"]
     }

file { ['/srv', '/srv/services', '/srv/services/websites']:
   ensure => directory,
}

file { ["${nginx::rootdir}/$name", "${nginx::rootdir}/$name/_sessions", "${nginx::rootdir}/$name/public_html", "${nginx::rootdir}/$name/_logs", "${nginx::rootdir}/$name/_tmp"]:
	owner => "${name}",
  	group => "www-data",
	ensure => "directory"
	 }

file { "${nginx::rootdir}/$name/public_html/index.php":
	ensure => "file",
        owner => "root",
        group => "root",
        mode  => "0644",
	content => "<?php phpinfo();?>"
     }
	

}



