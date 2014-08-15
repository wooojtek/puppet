class mysql::install (
  $user,
  $group,
){
  $mysql_pkgs = [
    'mysql55',
    'mysql55-server',
    'mysql55-libs',
    'mysql55-test',
    'mysql55-devel'
  ]
  
  package { $mysql_pkgs:
    ensure  => present,
    require => User[$user],
  }

  user { $user:
    ensure  => present,
    comment => 'MySQL user',
    gid     => $group,
    shell   => '/bin/false',
    require => Group[$group],
  }

  group { $group:
    ensure => present,
  }
}