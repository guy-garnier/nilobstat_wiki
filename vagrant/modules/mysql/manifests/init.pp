class mysql {

  # root mysql password
  $mysqlpw = "d3v0p5"

  # install mysql server
  package { "mysql-server":
    ensure => present,
    require => Exec["apt-get update"]
  }

  #start mysql service
  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }

  # set mysql password
  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p$mysqlpw status",
    command => "mysqladmin -uroot password $mysqlpw",
    require => Service["mysql"],
  }

  # write some data to the db
  exec { "write-mysql-data":
    #unless => "mysqladmin -uroot -p$mysqlpw status",
    command => "mysql -uroot -p$mysqlpw < /vagrant/dump.sql",
    require => Exec["set-mysql-password"],
  }
}
