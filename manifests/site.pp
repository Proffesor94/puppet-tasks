node 'slave1.puppet' {

  include static
}

node 'slave2.puppet' {

  include dynamic
}

node 'master.puppet' {

  include proxy
}

node mineserver.puppet {

  include role::mineserver  
}