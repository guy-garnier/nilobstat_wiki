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

  # create database structure
  exec { "write-mysql-data":
    command => "mysql -uroot -p$mysqlpw < /vagrant/static.sql",
    require => Exec["set-mysql-password"],
  }

  # write some data to the db
  exec { "write-mysql-data":
    command => "mysql -uroot -p$mysqlpw < /vagrant/dump.sql",
    require => Exec["set-mysql-password"],
  }
}
