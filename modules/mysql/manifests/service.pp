class mysql::service (
  $enabled,
  $ensure,
  ) {
  service { 'mysqld':
    ensure     => $ensure,
    hasstatus  => true,
    hasrestart => true,
    enable    => $enabled,
    require    => Class['mysql::config'],
  }
}