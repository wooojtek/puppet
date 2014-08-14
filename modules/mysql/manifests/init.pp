class mysql (
  $user = 'mysql',
  $group = 'mysql',
  $service_enabled = true,
  $service_running = true,
){
  class { 'mysql::install':
    user  => $user,
    group => $group,
  }

  class { 'mysql::config':
    user  => $user,
    group => $group,
  }

  class { 'mysql::service':
    ensure  => $service_running,
    enabled => $service_enabled,
  }
}