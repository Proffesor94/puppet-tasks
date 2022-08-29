node slave1.puppet {
  include profile::static
}

node slave2.puppet {
  include profile::dynamic
}

node master.puppet {
  include profile::proxy
}

node mineserver.puppet {
  include role::mineserver  
}