class profile::proxy {
 
include nginx

nginx::resource::server { 'proxy-static':
    listen_port => 80,
    proxy       => 'http://192.168.56.21:80',
                        }

nginx::resource::server { 'proxy-dynamic':
    listen_port => 81,
    proxy       => 'http://192.168.56.22:80',
                        }
}