define nginx::vhost (
        $document_root  = "",
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
        require => Package["nginx"],
        notify  => Service["nginx"]
     }


}
