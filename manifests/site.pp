node 'slave1.puppet' {

 package { 'httpd':
  ensure => latest,
 }

 file {'/var/www/html/index.html':
  ensure => file,
  source => 'puppet:///modules/static/index.html'
 }

 service { 'httpd':
  ensure => running,
  enable => true,
 }

 service { 'firewalld':
  ensure => stopped,
  enable => false,
 }

 file {'/root/README':
  ensure => absent,
 }
}

node 'slave2.puppet' {

 package { ['httpd','php'] :
  ensure => latest,
 }

 file {'/var/www/html/index.php':
  ensure => file,
  source => 'puppet:///modules/dynamic/index.php'
 }
 
 service { 'httpd':
  ensure => running,
  enable => true,
 }
 
 service { 'firewalld':
  ensure => stopped,
  enable => false,
 }
 
 file {'/root/README':
  ensure => absent,
 }
}

node 'master.puppet' {

include nginx

nginx::resource::server { 'proxy-master':
    listen_port => 81,
    proxy       => 'http://192.168.56.22:81',
                        }
}

node mineserver.puppet {

  include role::mineserver
  
}